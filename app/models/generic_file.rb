class GenericFile < ActiveRecord::Base
  
  mount_uploader :file, GenericFileUploader
  
  belongs_to :archeological_site
end
