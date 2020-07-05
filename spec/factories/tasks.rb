FactoryBot.define do
  factory :task do
    user
    name { 'detail1' }
    detail { 'detail2' }
    end_date { '2020-6-28' }
    priority { '高' }
    status { '完了' }
  end

  factory :second_task, class: Task do
    name { 'detail3' }
    detail { 'detail4' }
    end_date { '2020-06-28' }
    priority { '中' }
    status { '完了' }
  end
end
