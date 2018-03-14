# frozen_string_literal: true

# Used by ArchaeologicalSites
class CeramicDiagnostic < ActiveRecord::Base
  
  has_paper_trail
  
  has_many :archeaological_sites_ceramic_diagnostics, dependent: :destroy
  has_many :archeaological_sites,
           through: :archeaological_sites_ceramic_diagnostics
end
