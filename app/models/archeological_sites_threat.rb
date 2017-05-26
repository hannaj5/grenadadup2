# frozen_string_literal: true

# Base model to store a list of possible threats. Essentially a high powered
# enumeration.
class ArcheologicalSitesThreat < ActiveRecord::Base
  belongs_to :archeological_site
  belongs_to :threat
end
