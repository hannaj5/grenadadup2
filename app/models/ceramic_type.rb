# frozen_string_literal: true

# Ceramic Types used by ArcheologicalSite
class CeramicType < ActiveRecord::Base
  has_many :archeological_sites_ceramic_types
  has_many :archeological_sites, through: :archeological_sites_ceramic_types
end
