class Photo < ActiveRecord::Base
  belongs_to :survey
  mount_uploader :file, Uploader
end
