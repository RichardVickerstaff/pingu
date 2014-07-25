FactoryGirl.define do
	factory :site_group, class: SiteGroup do
    name 'a group'

    trait :uk  do
      name 'a group'
    end

    trait :with_one_site do
      after :create do |group, _|
        group.sites << create(:bbc)
      end
    end
	end
end
