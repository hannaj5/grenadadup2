class Map < ActiveRecord::Base
  
  mount_uploader :file, MapUploader
  
  validates_presence_of :file
  validates_presence_of :name
  
  belongs_to :archeological_site
end
