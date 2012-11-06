class GalleriesController < ApplicationController

  expose(:galleries) {Gallery.order(:priority)}
  expose(:gallery)
  expose(:images) {gallery.images.order(:priority)}  
  expose(:first_image) {images.first}

  def create
    @gallery = Gallery.new(params[:gallery])
    if gallery.save
      redirect_to @gallery, notice: "Gallery successfully created."
    else
      render "new"
    end
  end

  def update
    if gallery.save
      redirect_to gallery
    else
      render "edit"
    end
  end

  def destroy
    gallery.destroy
    redirect_to galleries_path, notice: "Gallery successfully deleted."
  end

end
