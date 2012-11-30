class ImagesController < ApplicationController
  expose(:images) {Image.order('images.priority, images.updated_at DESC')}
  expose(:image)
  expose(:gallery)
  expose(:owner) {image.gallery}
  expose(:neighbors) {owner.images.order('images.priority, images.updated_at DESC')}
  expose(:next_image) {image.next(neighbors)}
  expose(:prior_image) {image.prior(neighbors)}

  def create

    if image.save
      redirect_to gallery, notice: "Image successfully created."
    else
      render "new"
    end
  end

  def update
    if image.save
      redirect_to owner, notice: "Image successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    image.destroy
    redirect_to owner, notice: "Image successfully deleted."
  end

end
