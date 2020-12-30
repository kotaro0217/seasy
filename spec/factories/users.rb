FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {"000aaa"}
    password_confirmation {password}
    first_name            {"ぜんかく"}
    family_name           {"ぜんかく"}
    read_first_name       {"ゼンカクカナ"}
    read_family_name      {"ゼンカクカナ"}
    birth                 {Faker::Date.birthday}
  end
end

