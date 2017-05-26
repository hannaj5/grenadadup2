# frozen_string_literal: true

# Stores ceramic types. Provides essentially an enumeration of them
# with the possibility of description.
class ArcheologicalSitesCeramicType < ActiveRecord::Base
  belongs_to :archeological_site
  belongs_to :ceramic_type
end
