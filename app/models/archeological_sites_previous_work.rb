# frozen_string_literal: true

# Information about previous work done at a site.
class ArcheologicalSitesPreviousWork < ActiveRecord::Base
  belongs_to :archeological_site
  belongs_to :previous_work
end
