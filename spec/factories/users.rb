FactoryBot.define do
  factory :user do
    nickname              {"tar22222222222222o"}
    email                 {Faker::Internet.email }
    password              {"abcd0000"}
    password_confirmation {password}
    birthday              {"1990-12-20"}
    surname               {"阿部"}
    first_name            {"宏"}
    surname_phonetic        {"アベ"}
    first_name_phonetic        {"ヒロシ"}
  end
end