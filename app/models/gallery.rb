class Gallery < ActiveRecord::Base
  attr_accessible :name, :category
  has_many :images, :dependent => :destroy

  validates_presence_of :name

  def thumb(image)
    if image
      return image.picture_url(:thumb).to_s
    else
      return ""
    end 
  end


end
