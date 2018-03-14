require 'rails_helper'

RSpec.describe CeramicType, type: :model do
  it {
    should have_many(
      :archaeological_sites
    ).through(:archaeological_sites_ceramic_types)
  }

  it {
    should have_many(:archaeological_sites_ceramic_types).dependent(:destroy)
  }

  it { should respond_to :name }
end
