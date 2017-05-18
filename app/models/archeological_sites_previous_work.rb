class ArcheologicalSitesPreviousWork < ActiveRecord::Base
  belongs_to :archeological_site
  belongs_to :previous_work
end
