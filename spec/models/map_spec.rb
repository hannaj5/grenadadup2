require 'rails_helper'

RSpec.describe Map, type: :model do
  it { should belong_to :archeological_site }
end
