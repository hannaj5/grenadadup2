# frozen_string_literal: true

# Used by ArcheologicalSites
class Threat < ActiveRecord::Base
  has_many :archeological_sites_threats
  has_many :archeological_sites, through: :archeological_sites_threats
end
