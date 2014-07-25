FactoryGirl.define do
	factory :site, class: Site do
    url 'some url'

    factory :bbc do
      url 'www.bbc.co.uk'
    end
	end
end

