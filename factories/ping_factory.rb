FactoryGirl.define do
  factory :ping, class: Ping do
    sequence :response_ms do |n|
      n * 10
    end

    trait :failed do
      response_ms(-1)
    end

  end
end
