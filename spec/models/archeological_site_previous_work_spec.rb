require 'rails_helper'

RSpec.describe ArcheologicalSitesPreviousWork, type: :model do
  it { should belong_to :archeological_site }
  it { should belong_to :previous_work }
end
