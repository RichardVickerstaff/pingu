require 'rails_helper'

describe Ping do
  it { is_expected.to validate_presence_of :response_ms }
  it { is_expected.to belong_to :site }
  it { is_expected.to belong_to :run  }
  it { is_expected.to delegate_method(:site_group).as(:site_group).to(:site) }
end
