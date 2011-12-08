FactoryGirl.define do
  factory :project do
    abbreviation "T"
    name "Test"
  end

  factory :ticket_type do
    name "foo"
  end

  factory :user do
    name "foo"
    email "me@example.com"
  end

  factory :ticket do
    title "foo"
    description "bar"
    association :project
    association :ticket_type
    association :user
  end
end
