require 'rails_helper'

RSpec.describe ArcheologicalSite, type: :model do
  it { should have_and_belong_to_many(:ceramic_types) }
  it { should have_and_belong_to_many(:ceramic_diagnostics) }
  it { should have_and_belong_to_many(:previous_work) }
  it { should have_and_belong_to_many(:threats) }
  
  it { should have_many :maps }
  it { should have_many :generic_files }

  it { should respond_to :site_number }
  it { should respond_to :site_name }
  it { should respond_to :parish }
  it { should respond_to :latitude }
  it { should respond_to :location_description }
  it { should respond_to :recommendations }
  it { should respond_to :summary }
  it { should respond_to :notes }
end
