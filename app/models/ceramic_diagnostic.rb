# frozen_string_literal: true

# Used by ArcheologicalSites
class CeramicDiagnostic < ActiveRecord::Base
  has_many :archeological_sites_ceramic_diagnostics
  has_many :archeological_sites, through: :archeological_sites_ceramic_diagnostics
end
