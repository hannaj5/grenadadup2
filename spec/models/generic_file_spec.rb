require 'rails_helper'

RSpec.describe GenericFile, type: :model do
  it { should belong_to(:archaeological_site) }
end
