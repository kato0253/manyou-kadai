require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  describe '優先順位並び替え' do
    context '優先順位ソートをクリック' do
      it '優先順位高順に並ぶ' do
        visit tasks_path
        click_on '優先順位ソート'
          task_list = all('.priority_high')
          expect(task_list[0]).to have_content '高'
          expect(task_list[1]).to have_content '中'
        end
      end
    end


  describe '検索機能' do
    context 'タイトル検索' do
      it 'タイトル検索可能' do
        visit tasks_path
        fill_in "name", with: 'task1'
        click_button 'Search'
        expect(page).to have_content 'task1'
      end
    end
  end

  context 'ステータス検索' do
    it 'ステータス検索可能' do
      visit tasks_path
      select "完了", from: 'status'
      click_button 'Search'
      expect(page).to have_content '完了'
    end
  end

    context 'タイトルとステータスで検索を' do
    it 'タイトルとステータスで検索可' do
        visit tasks_path
        fill_in "name", with: 'task1'
        select "完了", from: 'status'
        click_button 'Search'
        expect(page).to have_content 'task1'
        expect(page).to have_content '完了'
      end
    end

  describe '終了期限並び変え' do
    context '終了期日入力、createクリック' do
      it 'データ保存' do
        visit new_task_path
        select '2020', from: 'task_end_date_1i'
        select '6', from: 'task_end_date_2i'
        select '30', from: 'task_end_date_3i'
        click_on 'commit'
        expect(page).to have_content '2020'
        expect(page).to have_content '6'
        expect(page).to have_content '30'
      end
    end
 end
end
