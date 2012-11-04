class ImagesController < ApplicationController
  expose(:images) {Image.order(:id)}
  expose(:image)
  expose(:gallery)
  expose(:owner) {image.gallery}
  expose(:neighbors) {owner.images.order(:id)}
  expose(:next_image) {image.next(images)}
  expose(:prior_image) {image.prior(images)}

  def create
    @image = gallery.images.new(params[:image])

    if @image.save
      redirect_to gallery, notice: "Image successfully created."
    else
      render "new"
    end
  end

  def update
    if image.save
      redirect_to gallery, notice: "Image successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    image.destroy
    redirect_to gallery, notice: "Image successfully deleted."
  end

end
