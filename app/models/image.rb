class Image < ActiveRecord::Base
  attr_accessible :category, :title, :picture, :medium, :dimensions, :gallery_id
  belongs_to :gallery
  mount_uploader :picture, PictureUploader

  def prior(images)
    if self != images.first
      return images[images.index(self) - 1]
    else
      return nil
    end
  end

  def next(images)
    if self != images.last
      return images[images.index(self) + 1]
    else
      return nil
    end
  end
end
