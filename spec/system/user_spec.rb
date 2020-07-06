require 'rails_helper'
RSpec.describe '​ユーザ登録・ログイン・ログアウト機能​・管理画面テスト', type: :system do

  describe '​ユーザ登録のテスト​' do
    context '​ユーザのデータがなくログインしていない場合​' do
      it '​ユーザ新規登録のテスト​' do
        visit new_user_path
        fill_in 'user_name', with: 'sample'
        fill_in 'user_email', with: 'sample@example.com'
        fill_in 'user_password', with: '00000000'
        fill_in 'user_password_confirmation', with: '00000000'
        click_on 'sign up'
        expect(page).to have_content 'sample'
      end
      it '​ログインしていない時はログイン画面に飛ぶテスト​' do
        visit tasks_path
        expect(current_path).to eq new_session_path
      end
    end
  end

  describe "セッション機能のテスト" do
    before { @user = FactoryBot.create(:user) }
    context "ユーザーのデータがあってログインしていない場合" do
      it "ログインができること" do
        visit new_session_path
        fill_in 'session_email', with: @user.email
        fill_in 'session_password', with: @user.password
        click_on "log in"
        expect(current_path).to eq user_path(id: @user.id)
      end
    end

    context "ユーザーのデータがあってログインしている場合" do
      before {
        visit new_session_path
        fill_in "session_email", with:  @user.email
        fill_in "session_password", with: @user.password
        click_on "log in"
      }

      it "自分の詳細画面に飛べること" do
        visit user_path(id: @user.id)
        expect(current_path).to eq user_path(id: @user.id)
      end

      it "一般ユーザが他人の詳細画面に飛ぶとタスク一覧ページに遷移すること" do
        @admin_user = FactoryBot.create(:admin_user)
        visit user_path(id: @admin_user.id)
        expect(page).to have_content "他の人のページへアクセスは出来ません"
      end

      it "ログアウトができること" do
        visit user_path(id: @user.id)
        click_on "log out"
        expect(page).to have_content "ログアウト完了"
      end
    end
  end

  describe "管理画面のテスト" do
    context "アドミンユーザーがない場合" do
      it "管理者は管理画面にアクセスできること" do
        FactoryBot.create(:admin_user)
        visit new_session_path
        fill_in "session_email", with: "admin@example.com​"
        fill_in "session_password", with: "00000000"
        click_on "log in"
        visit admin_users_path
        expect(page).to have_content "new registration"
      end
    end

    context "一般ユーザーでログインしている場合" do
      it "一般ユーザは管理画面にアクセスできないこと" do
        FactoryBot.create(:user)
        visit new_session_path
        fill_in "session_email", with: "sample1@example.com"
        fill_in "session_password", with: "00000000"
        click_on "log in"
        visit admin_users_path
        expect(page).to have_content "ログイン必要"
      end
    end

    context "管理者でログインしている場合" do
      before {
        FactoryBot.create(:admin_user)
        visit new_session_path
        fill_in "session_email", with: "admin@example.com"
        fill_in "session_password", with: "00000000"
        click_on "log in"
        visit admin_users_path
      }

      it "管理者はユーザを新規登録できること" do
        click_on "new registration"
        fill_in "user_name", with: "111"
        fill_in "user_email", with: "111@example.com"
        fill_in "user_password", with: "00000000"
        fill_in "user_password_confirmation", with: "00000000"
        click_on "sign up"
        expect(page).to have_content "111"
      end

      it  "管理者はユーザの詳細画面にアクセスできること" do
        @user = FactoryBot.create(:user)
        visit admin_user_path(id: @user.id)
        expect(page).to have_content "sample"
      end

      it "管理者はユーザの編集画面からユーザを編集できること" do
        @user = FactoryBot.create(:user)
        visit edit_admin_user_path(id: @user.id)
        fill_in 'user_name', with: 'sample2'
        fill_in 'user_email', with: 'sample2@example.com'
        fill_in 'user_password', with: '00000000'
        fill_in 'user_password_confirmation', with: '00000000'
        click_button 'sign up'
        expect(page).to have_content "sample2"
      end

      it "管理者はユーザの削除をできること" do
        @user = FactoryBot.create(:user)
        visit admin_users_path
        click_on "delete", match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "delete"
      end
    end
  end
end
