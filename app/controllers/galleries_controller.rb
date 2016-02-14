class GalleriesController < ApplicationController

  before_filter :require_user, except: [:index, :show]

  expose(:galleries) {Gallery.order(:priority)}
  expose(:gallery)
  expose(:images) {gallery.images.order('images.priority, images.updated_at DESC')}  
  expose(:first_image) {images.first}

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to @gallery, notice: "Gallery successfully created."
    else
      render "new"
    end
  end

  def update
    if gallery.update_attributes(gallery_params)
      redirect_to gallery, notice: "Gallery successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    gallery.destroy
    redirect_to galleries_path, notice: "Gallery successfully deleted."
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :category, :thumb_url, :priority)
  end
end
