# frozen_string_literal: true

FactoryBot.define do
  factory :sub_comment do
    body
    user
    comment
  end
end
