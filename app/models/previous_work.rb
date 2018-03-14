# frozen_string_literal: true

# Used by ArchaeologicalSites
class PreviousWork < ActiveRecord::Base
  
  has_paper_trail
  
  has_many :archaeological_sites_previous_works, dependent: :destroy
  has_many :archaeological_sites, through: :archaeological_sites_previous_works
end
