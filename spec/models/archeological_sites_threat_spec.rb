require 'rails_helper'

RSpec.describe ArchaeologicalSitesThreat, type: :model do
  it { should belong_to :archaeological_site }
  it { should belong_to :threat }
end
