FactoryGirl.define do
  factory :probe, class: Probe do
    ip { Faker::Internet.ip_v4_address }
    location "Ipswich"

    uid { Faker::Internet.mac_address.gsub ':', '' }
  end
end
