# frozen_string_literal: true

# Base model to store a list of possible threats. Essentially a high powered
# enumeration.
class ArchaeologicalSitesThreat < ActiveRecord::Base
  belongs_to :archaeological_site
  belongs_to :threat
end
