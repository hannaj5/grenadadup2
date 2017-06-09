# frozen_string_literal: true

# A CSV file that allows bulk upload of the tabular data.
# At the current time, dependent files such as maps and generic files
# must be uploaded separately.
class SiteFile < ActiveRecord::Base
  mount_uploader :file, SiteFileUploader
end
