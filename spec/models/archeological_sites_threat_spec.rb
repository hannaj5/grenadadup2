require 'rails_helper'

RSpec.describe ArcheologicalSitesThreat, type: :model do
  it { should belong_to :archeological_site }
  it { should belong_to :threat }
end
