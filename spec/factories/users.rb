FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'000000a'}
    password_confirmation {password}
    last_name             {'田中'}
    first_name            {'花子'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'ハナコ'}
    birth_day             {'2024-02-03'}
  end
end