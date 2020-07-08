FactoryBot.define do
  factory :task do
    user
    name { 'detail1' }
    detail { 'detail2' }
    end_date { DateTime.now }
    priority { '高' }
    status { '完了' }
  end

  factory :second_task, class: Task do
    user
    name { 'detail3' }
    detail { 'detail4' }
    end_date { DateTime.now.since(3.days) }
    priority { '中' }
    status { '完了' }
  end
end
