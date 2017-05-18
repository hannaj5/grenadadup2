require 'rails_helper'

RSpec.describe Threat, type: :model do
  it { should have_many(:archeological_sites).through(:archeological_sites_threats) }

  it { should respond_to :name }
end
