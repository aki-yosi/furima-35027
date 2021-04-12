FactoryBot.define do
    factory :user do
      nickname {Faker::Name.name}
      email {Faker::Internet.free_email}
      password { "0a" +  Faker::Internet.password(min_length: 6)}
      password_confirmation {password }
      birth_day { "1999-01-01" }
      family_name { "秋" }
      first_name { "秋" }
      family_name_kana { "アキ" }
      first_name_kana { "アキ" }
   end
  end