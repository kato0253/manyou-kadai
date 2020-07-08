require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    @user1 = create(:user)
    @user2 = create(:admin_user)
    @task1 = create(:task, user: @user1)
    @task2 = create(:second_task, user: @user1)
    @label1 = create(:label)
    @label2 = create(:second_label)
    @label3 = create(:third_label)
    create(:labelling, task: @task1, label: @label1)
    create(:labelling, task: @task1, label: @label2)
    create(:labelling, task: @task1, label: @label3)
    visit new_session_path
    fill_in "session[email]", with: 'sample@example.com'
    fill_in "session[password]", with: '00000000'
    click_on "log in"
  end
  describe 'タスク一覧画面' do
    context 'タスク作成' do
      it '作成済タスク表示' do
        visit tasks_path
        expect(page).to have_content 'detail2'
        expect(page).to have_content 'detail4'
      end
    end
  end
    context '終了期限でソート' do
      it 'タスクが終了期限順に並んでいる' do
        visit tasks_path
        click_on '終了期限sort'
        visit tasks_path(sort_expired: "true")
        list = all('.task_row') # タスク一覧を配列として取得するため、View側でidを振っておく
        expect(list[0]).to have_content 'detail4'
        expect(list[1]).to have_content 'detail2'
      end
    end

  describe 'タスク登録画面' do
    context '必要項目入力、createボタンを押す' do
      it 'データが保存される' do
        visit new_task_path
        fill_in 'task[name]', with: 'AAA'
        fill_in 'task[detail]', with: 'BBB'
        select '2020', from: 'task[end_date(1i)]'
        select 'August', from: 'task[end_date(2i)]'
        select '9', from: 'task[end_date(3i)]'
        select '高', from: 'task[priority]'
        select '未着手', from: 'task[status]'
        check "FactoryラベルA"
        check "FactoryラベルB"
        click_on "Create Task"
        expect(page).to have_content 'AAA'
        expect(page).to have_content 'BBB'
        expect(page).to have_content '2020-08-09'
        expect(page).to have_content '未着手'
        expect(page).to have_content '高'
        expect(page).to have_content "FactoryラベルA"
        expect(page).to have_content "FactoryラベルB"
      end
    end
  end

  context 'ラベル検索' do
    it '指定ラベルのみ表示' do
      visit tasks_path
      select 'FactoryラベルA', from: 'label_id'
      click_on 'Search'
      expect(page).to have_content 'FactoryラベルA'
    end
  end
end
