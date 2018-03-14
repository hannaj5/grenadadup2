require 'rails_helper'

RSpec.describe CeramicDiagnostic, type: :model do
  it {
    should have_many(
      :archaeological_sites
    ).through(:archaeological_sites_ceramic_diagnostics)
  }
  it {
    should have_many(
      :archaeological_sites_ceramic_diagnostics
    ).dependent(:destroy)
  }

  it { should respond_to :name }
end
