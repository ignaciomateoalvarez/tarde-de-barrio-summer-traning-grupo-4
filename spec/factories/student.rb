FactoryBot.define do
  factory :student do
    name { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    birthdate { Faker::Date.birthday(min_age: 5, max_age: 25) }
    address { Faker::Address.full_address }
    school_grade { Student.school_grades.keys[rand(0..2)] }
    active_student { [true, false].sample }
  end
end