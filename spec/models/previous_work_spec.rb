require 'rails_helper'

RSpec.describe PreviousWork, type: :model do
  it {
    should have_many(
      :archaeological_sites
    ).through(:archaeological_sites_previous_works)
  }

  it {
    should have_many(:archaeological_sites_previous_works).dependent(:destroy)
  }

  it { should respond_to :name }
end
