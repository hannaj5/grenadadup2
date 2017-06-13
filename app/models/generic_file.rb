# frozen_string_literal: true

# Store various files to be associated with a site.
class GenericFile < ActiveRecord::Base
  
  has_paper_trail
  
  mount_uploader :file, GenericFileUploader

  validates_presence_of :file
  validates_presence_of :name

  belongs_to :archeological_site
end
