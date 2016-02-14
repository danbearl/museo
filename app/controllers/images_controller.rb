class ImagesController < ApplicationController

  before_filter :require_user, except: [:show]

  expose(:images) {Image.order('images.priority, images.updated_at DESC')}
  expose(:image)
  expose(:gallery)
  expose(:owner) {image.gallery}
  expose(:neighbors) {owner.images.order('images.priority, images.updated_at DESC')}
  expose(:next_image) {image.next(neighbors)}
  expose(:prior_image) {image.prior(neighbors)}

  def create

    @image = gallery.images.build(image_params)
    if @image.save
      redirect_to @image, notice: "Image successfully created."
    else
      render "new"
    end
  end

  def update
    if image.update_attributes(image_params)
      redirect_to image_path(image.id), notice: "Image successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    image.destroy
    unless owner.nil?
      redirect_to owner, notice: "Image successfully deleted."
    else
      redirect_to :root, notice: "Image successfully deleted."
    end
  end

  private

  def image_params
    params.require(:image).permit(:category, :title, :picture, :medium, :dimensions, :gallery_id, :priority)
  end
end
