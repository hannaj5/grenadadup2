require 'rails_helper'

RSpec.describe ArchaeologicalSite, type: :model do
  it {
    should have_many(
      :ceramic_types
    ).through(:archaeological_sites_ceramic_types)
  }
  it {
    should have_many(
      :ceramic_diagnostics
    ).through(:archaeological_sites_ceramic_diagnostics)
  }
  it {
    should have_many(
      :previous_works
    ).through(:archaeological_sites_previous_works)
  }
  it {
    should have_many(
      :threats
    ).through(:archaeological_sites_threats)
  }

  it { should have_many(:maps).dependent(:destroy) }
  it { should have_many(:generic_files).dependent(:destroy) }

  it { should respond_to :site_number }
  it { should respond_to :site_name }
  it { should respond_to :parish }
  it { should respond_to :latitude }
  it { should respond_to :location_description }
  it { should respond_to :recommendations }
  it { should respond_to :summary }
  it { should respond_to :notes }
  it { should respond_to :representative_image_id }
end
