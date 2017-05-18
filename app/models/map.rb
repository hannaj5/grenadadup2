class Map < ActiveRecord::Base
  
  mount_uploader :file, MapUploader
  
  belongs_to :archeological_site
end
