FactoryGirl.define do
	factory :run, class: Run do
    time {Time.zone.now}
	end
end

