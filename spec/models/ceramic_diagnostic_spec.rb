require 'rails_helper'

RSpec.describe CeramicDiagnostic, type: :model do
  it { should have_and_belong_to_many(:archeological_sites) }

  it { should respond_to :name }
end
