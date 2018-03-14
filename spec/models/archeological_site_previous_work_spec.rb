require 'rails_helper'

RSpec.describe ArchaeologicalSitesPreviousWork, type: :model do
  it { should belong_to :archaeological_site }
  it { should belong_to :previous_work }
end
