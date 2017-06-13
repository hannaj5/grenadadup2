# frozen_string_literal: true

# Ceramic Types used by ArcheologicalSite
class CeramicType < ActiveRecord::Base
  
  has_paper_trail
  
  has_many :archeological_sites_ceramic_types, dependent: :destroy
  has_many :archeological_sites, through: :archeological_sites_ceramic_types
end
