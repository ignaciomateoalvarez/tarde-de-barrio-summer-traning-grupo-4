FactoryBot.define do
  factory :comment do
    body { "Hola hola hola" }
    user
    student
  end
end
