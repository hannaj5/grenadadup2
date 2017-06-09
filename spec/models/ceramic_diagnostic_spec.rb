require 'rails_helper'

RSpec.describe CeramicDiagnostic, type: :model do
  it {
    should have_many(
      :archeological_sites
    ).through(:archeological_sites_ceramic_diagnostics)
  }
  it { should have_many(:archeological_sites_ceramic_diagnostics).dependent(:destroy) }

  it { should respond_to :name }
end
