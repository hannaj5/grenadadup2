# frozen_string_literal: true

# Used by ArcheologicalSites
class Threat < ActiveRecord::Base
  
  has_paper_trail
  
  has_many :archeological_sites_threats, dependent: :destroy
  has_many :archeological_sites, through: :archeological_sites_threats
end
