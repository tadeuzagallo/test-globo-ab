FactoryGirl.define do
  factory :choice do
    sequence(:url) { |n| "http://foo.com/#{n}" }
    weight 1
  end
end
