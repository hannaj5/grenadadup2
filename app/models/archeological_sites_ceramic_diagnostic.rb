class ArcheologicalSitesCeramicDiagnostic < ActiveRecord::Base
  belongs_to :archeological_site
  belongs_to :ceramic_diagnostic
end
