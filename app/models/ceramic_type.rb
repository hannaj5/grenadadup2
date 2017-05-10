# frozen_string_literal: true

# Ceramic Types used by ArcheologicalSite
class CeramicType < ActiveRecord::Base
  has_and_belongs_to_many :archeological_sites
end
