require 'rails_helper'

RSpec.describe ArchaeologicalSitesCeramicDiagnostic, type: :model do
  it { should belong_to :archaeological_site }
  it { should belong_to :ceramic_diagnostic }
end
