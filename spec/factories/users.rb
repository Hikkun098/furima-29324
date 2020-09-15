FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"abcd0000"}
    password_confirmation {password}
    birthday              {"1990-12-20"}
    surname               {"阿部"}
    first_name            {"宏"}
    phonetic_name1        {"アベ"}
    phonetic_name2        {"ヒロシ"}
  end
end