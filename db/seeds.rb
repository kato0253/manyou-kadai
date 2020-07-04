name = Faker::Games::Pokemon.name
email = Faker::Internet.email
User.create!(
             name: name,
             email: email,
             password: '00000000',
             admin: 'true',
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

name = Faker::Games::Pokemon.name
email = Faker::Internet.email
User.create!(
             name: name,
             email: email,
             password: '00000000',
             admin: 'false',
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

# email = Faker::Internet.email
# User.create!(id: rand(100),
#              name: 'sample',
#              email: email,
#              password: '00000000',
#              admin: 'false',
#             )
#
# priority_array=["高","中","低"]
# status_array=["未着手","着手中","完了"]
#
#   name = Faker::Games::Pokemon.name
#   detail = Faker::Games::Pokemon.name
#   end_date = Faker::Date.between(from: 2.days.ago,to: Date.today)
#   priority = priority_array[rand(3)]
#   status = status_array[rand(3)]
#   Task.create!(name: name,
#                detail: detail,
#                end_date: end_date,
#                priority: priority,
#                status: status,
#                user_id: 2,
#               )

# 2.times do |i|
#   Task.create(user_id: Task.find(i+1).id, detail: "Star Wars #{i+1}")
# end
