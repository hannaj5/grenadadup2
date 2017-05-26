require 'rails_helper'

RSpec.describe PreviousWork, type: :model do
  it {
    should have_many(
      :archeological_sites
    ).through(:archeological_sites_previous_works)
  }

  it { should respond_to :name }
end
