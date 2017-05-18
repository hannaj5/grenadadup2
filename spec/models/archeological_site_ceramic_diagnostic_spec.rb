require 'rails_helper'

RSpec.describe ArcheologicalSitesCeramicDiagnostic, type: :model do
  it { should belong_to :archeological_site }
  it { should belong_to :ceramic_diagnostic }
end
