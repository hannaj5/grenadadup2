# frozen_string_literal: true

# Stores ceramic types. Provides essentially an enumeration of them
# with the possibility of description.
class ArchaeologicalSitesCeramicType < ActiveRecord::Base
  belongs_to :archaeological_site
  belongs_to :ceramic_type
end
