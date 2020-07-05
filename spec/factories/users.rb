# パスワードは’’が無いとエラーが出る。user_spec.rbのパスワードを''を外し整数型に変更し対応させてもエラー。
FactoryBot.define do
  factory :user do
    # id { 3 }
    name { 'sample' }
    email { 'sampleA@example.com' }
    password { '00000000' }
    admin { false }
  end
  factory :admin_user, class: User do
    # id { 4 }
    name { 'admin' }
    email { 'adminA@example.com' }
    password { '00000000' }
    admin { true }
  end
end
