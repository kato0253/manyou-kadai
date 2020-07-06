require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :model do
  it 'nameが空ならバリデーション不通過' do
    task = Task.new(name: '', detail: '失敗')
    expect(task).not_to be_valid
  end
  it 'detailが空ならバリデーション不通過' do
    task = Task.new(name: '失敗', detail: '')
    expect(task).not_to be_valid
  end
  it 'nameとdetailに内容が記載されていなければバリデーション通過' do
    task = Task.new(name: '', detail: '')
    expect(task).to be_valid
  end
end
