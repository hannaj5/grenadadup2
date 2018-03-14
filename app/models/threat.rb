# frozen_string_literal: true

# Used by ArcheologicalSites
class Threat < ActiveRecord::Base
  
  has_paper_trail
  
  has_many :archaeological_sites_threats, dependent: :destroy
  has_many :archaeological_sites, through: :archaeological_sites_threats
end
