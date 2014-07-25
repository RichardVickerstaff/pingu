require 'rails_helper'

describe SiteGroup do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to have_many :sites }
end
