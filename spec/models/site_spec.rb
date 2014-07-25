require 'rails_helper'

describe Site do
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to belong_to :site_group }
end
