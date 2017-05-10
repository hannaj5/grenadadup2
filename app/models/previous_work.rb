# frozen_string_literal: true

# Used by ArcheologicalSites
class PreviousWork < ActiveRecord::Base
  has_and_belongs_to_many :archeological_sites
end
