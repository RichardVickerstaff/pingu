FactoryGirl.define do
  factory :probe, class: Probe do
    ip { Faker::Internet.ip_v4_address }
    location "Ipswich"

    sequence(:name) { |n| "Test Probe #{n}" }
  end
end
