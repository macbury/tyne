FactoryGirl.define do
  factory :project do
    abbreviation "T"
    name "Test"
  end

  factory :ticket_type do
    name "foo"
  end

  factory :ticket do
    title "foo"
    association :project
    association :ticket_type
  end

  factory :user do
    name "foo"
    email "me@example.com"
  end
end
