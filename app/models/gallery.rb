class Gallery < ActiveRecord::Base
  attr_accessible :name, :category
  has_many :images, :dependent => :destroy

  validates_presence_of :name

  def images_to_rows(images)
    rows = []
    while images.length > 4 do
      rows << images.slice!(0,4)
    end

    if images.length > 0
      rows << images
    end

    return rows
  end

  def thumb(image)
    if image
      return image.picture_url(:thumb).to_s
    else
      return ""
    end 
  end


end
