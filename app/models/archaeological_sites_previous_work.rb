# frozen_string_literal: true

# Information about previous work done at a site.
class ArchaeologicalSitesPreviousWork < ActiveRecord::Base
  belongs_to :archaeological_site
  belongs_to :previous_work
end
