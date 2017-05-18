class ArcheologicalSitesThreat < ActiveRecord::Base
  belongs_to :archeological_site 
  belongs_to :threat
end
