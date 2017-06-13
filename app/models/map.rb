# frozen_string_literal: true

# Information about uploaded map images.
class Map < ActiveRecord::Base
  
  has_paper_trail
  
  mount_uploader :file, MapUploader

  validates_presence_of :file
  validates_presence_of :name

  belongs_to :archeological_site
end
