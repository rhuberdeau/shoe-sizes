FactoryGirl.define do
  factory :friend do
    sequence(:name) { |n| "Person #{n}" }
    age '23'
    shoe
  end
  
  factory :shoe do
    sequence(:size) {|n| n }
  end
end