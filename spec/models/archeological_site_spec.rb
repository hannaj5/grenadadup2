require 'rails_helper'

RSpec.describe ArcheologicalSite, type: :model do
  it {
    should have_many(
      :ceramic_types
    ).through(:archeological_sites_ceramic_types)
  }
  it {
    should have_many(
      :ceramic_diagnostics
    ).through(:archeological_sites_ceramic_diagnostics)
  }
  it {
    should have_many(
      :previous_works
    ).through(:archeological_sites_previous_works)
  }
  it {
    should have_many(
      :threats
    ).through(:archeological_sites_threats)
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
