require 'rails_helper'

RSpec.describe ArchaeologicalSitesCeramicType, type: :model do
  it { should belong_to :archaeological_site }
  it { should belong_to :ceramic_type }
end
