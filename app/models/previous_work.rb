# frozen_string_literal: true

# Used by ArcheologicalSites
class PreviousWork < ActiveRecord::Base
  has_many :archeological_sites_previous_works
  has_many :archeological_sites, through: :archeological_sites_previous_works
end
