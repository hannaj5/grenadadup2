# frozen_string_literal: true

# Join table to facilitate ArcheologicalSite has_many CeramicDiagnositcs
# through relationship.
class ArchaeologicalSitesCeramicDiagnostic < ActiveRecord::Base
  belongs_to :archaeological_site
  belongs_to :ceramic_diagnostic
end
