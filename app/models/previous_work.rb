# frozen_string_literal: true

# Used by ArcheologicalSites
class PreviousWork < ActiveRecord::Base
  
  has_paper_trail
  
  has_many :archeological_sites_previous_works, dependent: :destroy
  has_many :archeological_sites, through: :archeological_sites_previous_works
end
