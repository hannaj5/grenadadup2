class Map < ActiveRecord::Base
  
  mount_uploaders :map, MapUploader
  
  belongs_to :archeological_site
end
