# frozen_string_literal: true

# Used by ArchaeologicalSites
class PreviousWork < ActiveRecord::Base
  
  has_paper_trail
  
  has_many :archeaological_sites_previous_works, dependent: :destroy
  has_many :archeaological_sites, through: :archeological_sites_previous_works
end
