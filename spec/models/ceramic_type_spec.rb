require 'rails_helper'

RSpec.describe CeramicType, type: :model do
  it {
    should have_many(
      :archeological_sites
    ).through(:archeological_sites_ceramic_types)
  }

  it {
    should have_many(:archeological_sites_ceramic_types).dependent(:destroy)
  }

  it { should respond_to :name }
end
