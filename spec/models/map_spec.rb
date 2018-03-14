require 'rails_helper'

RSpec.describe Map, type: :model do
  it { should belong_to(:archaeological_site) }
end
