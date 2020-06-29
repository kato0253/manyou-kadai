# require 'rails_helper'
# RSpec.describe 'タスク管理機能', type: :model do
#   it 'titleが空ならバリデーションが通らない' do
#     task = Task.new(name: '', detail: '失敗')
#     #taskが妥当（valid）でないことを期待する
#     expect(task).not_to be_valid
#   end
#   it 'detailが空ならバリデーションが通らない' do
#     task = Task.new(name: '失敗', detail: '')
#     expect(task).not_to be_valid
#   end
#   it 'nameとdetailに内容が記載されていなければバリデーションが通る' do
#     task = Task.new(name: '', detail: '')
#     expect(task).not_to be_valid
#   end
# end

# require 'rails_helper'
# RSpec.describe 'タスク管理機能', type: :model do
#   it 'titleが空ならバリデーションが通らない' do
#     task = Task.new(title: '', content: '失敗テスト')
#     expect(task).not_to be_valid
#   end
#   it 'contentが空ならバリデーションが通らない' do
#     # ここに内容を記載する
#   end
#   it 'titleとcontentに内容が記載されていればバリデーションが通る' do
#     # ここに内容を記載する
#   end
# end
