# name = Faker::Games::Pokemon.name
# email = Faker::Internet.email
User.create!(
             name: 'sample1',
             email: 'sample1@example.com',
             password: '00000000',
             admin: true,
            )

priority_array=["高","中","低"]
status_array=["未着手","着手中","完了"]


detail = Faker::Games::Pokemon.name
end_date = Faker::Date.between(from: 2.days.ago,to: Date.today)
priority = priority_array[rand(3)]
status = status_array[rand(3)]

User.all.each do |user|
user.tasks.create!(name: "#{user}",
             detail: detail,
             end_date: end_date,
             priority: priority,
             status: status,
            )
end

Label.create!(name: 'A')
Label.create!(name: 'B')
Label.create!(name: 'C')

User.create!(
             name: 'sample2',
             email: 'sample2@example.com',
             password: '00000000',
             admin: false,
            )

priority_array=["高","中","低"]
status_array=["未着手","着手中","完了"]


detail = Faker::Games::Pokemon.name
end_date = Faker::Date.between(from: 2.days.ago,to: Date.today)
priority = priority_array[rand(3)]
status = status_array[rand(3)]

User.all.each do |user|
user.tasks.create!(name: "#{user}",
             detail: detail,
             end_date: end_date,
             priority: priority,
             status: status,
            )
end
