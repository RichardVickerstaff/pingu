FactoryGirl.define do
  factory :run, class: Run do
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
