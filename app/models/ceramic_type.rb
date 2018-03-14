# frozen_string_literal: true

# Ceramic Types used by ArchaeologicalSite
class CeramicType < ActiveRecord::Base
  
  has_paper_trail
  
  has_many :archaeological_sites_ceramic_types, dependent: :destroy
  has_many :archaeological_sites, through: :archeaological_sites_ceramic_types
end
