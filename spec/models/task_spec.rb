require 'rails_helper'

RSpec.describe 'scope検索', type: :model do
  context 'scopeメソッドで検索をした場合' do
    before do
      FactoryBot.create(:task)
      # FactoryBot.create(:second_task)
    end
    it "scopeタイトル検索" do
      expect(Task.name_search('detail1').count).to eq 1
    end
    it "scopeステータス検索" do
      expect(Task.status_search('完了').count).to eq 1
    end
    it "scope nameとsatus両方検索" do
      expect(Task.name_search('detail1').status_search('完了').count).to eq 1
    end
  end
end

RSpec.describe 'タスク管理機能', type: :model do
  it 'name空バリデーション不可' do
    task = Task.new(name: '', detail: '失敗')
    expect(task).not_to be_valid
  end
  it 'detail空バリデーション不可' do
    task = Task.new(name: '失敗', detail: '')
    expect(task).not_to be_valid
  end
  it 'nameとdetail内容有、バリデーション可' do
    task = Task.new(name: '成功' , detail: '成功')
    expect(task).to be_invalid
  end
end
