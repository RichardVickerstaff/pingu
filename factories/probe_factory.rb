FactoryGirl.define do
  factory :probe, class: Probe do
    ip { Faker::Internet.ip_v4_address }
    name  'probe1'
    location 'Ipswich'
  end
end
