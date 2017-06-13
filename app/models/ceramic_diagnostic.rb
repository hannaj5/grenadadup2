# frozen_string_literal: true

# Used by ArcheologicalSites
class CeramicDiagnostic < ActiveRecord::Base
  
  has_paper_trail
  
  has_many :archeological_sites_ceramic_diagnostics, dependent: :destroy
  has_many :archeological_sites,
           through: :archeological_sites_ceramic_diagnostics
end
