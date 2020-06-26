require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  # background do
  #   # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
  # # Task.create!(name: 'test_task_01', detail: 'testtesttest')
  # # Task.create!(name: 'test_task_02', detail: 'mofmofmofmof')
  # @task = FactoryBot.create(:task)
  # @task = FactoryBot.create(:second_task)
  # end
  before do
  # # # #  # 「タスク一覧画面」や「タスク詳細画面」などそれぞれのテストケースで、before内のコードが実行される
  # # # #  # 各テストで使用するタスクを1件作成する
  # # # #  # 作成したタスクオブジェクトを各テストケースで呼び出せるようにインスタンス変数に代入
  # # #  @task = FactoryBot.create(:task)
  @task = FactoryBot.create(:task)
  @new_task = FactoryBot.create(:second_task)
  end
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示される'do
  # #       # beforeに必要なタスクデータが作成されるので、ここでテストデータ作成処理を書く必要がない
        visit tasks_path
        expect(page).to have_content 'task'
  # #   # テストコードを it '~' do end ブロックの中に記載する
  # #   # it '作成済みのタスクが表示される' do
  # #   #   # テストで使用するためのタスクを作成
  # #   #   # task = FactoryBot.create(:task)
  # #   #   # タスク一覧ページに遷移
  # #   #   visit tasks_path
  # #   #   # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
  # #   #   # have_contentされているか。（含まれているか。）ということをexpectする（確認・期待する）
  # #   #   expect(page).to have_content 'task'
  # #   #   # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
  end
  context '複数のタスクを作成した場合' do
   it 'タスクが作成日時の降順に並んでいる' do
     # task = FactoryBot.create(:task ,name: 'task')
     # new_task = FactoryBot.create(:second_task,name: 'new_task')
     visit tasks_path
     task_list = all('.task_row') # タスク一覧を配列として取得するため、View側でidを振っておく
     expect(task_list[0]).to have_content 'task1'
     expect(task_list[1]).to have_content 'task0'
   end
 end
end

#   describe 'タスク登録画面' do
#     context '必要項目を入力して、createボタンを押した場合' do
#       it 'データが保存される'do
#        # new_task_pathにvisitする（タスク登録ページに遷移する）
#        visit new_task_path
#        # 1.ここにnew_task_pathにvisitする処理を書く
#        task = FactoryBot.create(:task, name: 'task',detail: 'task')
#        # 「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄に
#        # タスクのタイトルと内容をそれぞれfill_in（入力）する
#        fill_in 'task[name]', with: 'task'
#        # 2.ここに「タスク名」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
#        # 3.ここに「タスク詳細」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
#        fill_in 'task[detail]', with: 'detail'
#        # 「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）
#        # 4.「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
#        click_on 'Create Task'
#        # clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
#        # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
#        # 5.タスク詳細ページに、テストコードで作成したはずのデータ（記述）がhave_contentされているか（含まれているか）を確認（期待）するコードを書く
#        expect(page).to have_content 'task'
#     end
#   end
# end
#   describe 'タスク詳細画面' do
#      context '任意のタスク詳細画面に遷移した場合' do
#        it '該当タスクの内容が表示されたページに遷移する'do
#        visit task_path(id: 5)
#        expect(page).to have_content 'task'
#        end
#      end
  # end
