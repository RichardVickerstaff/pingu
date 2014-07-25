FactoryGirl.define do
	factory :site, class: Site do
    url {Faker::Internet.url}

    factory :bbc do
      url 'www.bbc.co.uk'
    end
	end
end

