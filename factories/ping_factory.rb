FactoryGirl.define do
  factory :ping, class: Ping do
    response_ms {|n| n * 10}

    trait :failed do
      response_ms -1
    end

  end
end
