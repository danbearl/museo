class Image < ActiveRecord::Base
  attr_accessible :category, :title, :picture
  belongs_to :gallery
  mount_uploader :picture, PictureUploader
end
