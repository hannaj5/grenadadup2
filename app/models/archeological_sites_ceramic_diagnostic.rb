# frozen_string_literal: true

# Join table to facilitate ArcheologicalSite has_many CeramicDiagnositcs
# through relationship.
class ArcheologicalSitesCeramicDiagnostic < ActiveRecord::Base
  belongs_to :archeological_site
  belongs_to :ceramic_diagnostic
end
