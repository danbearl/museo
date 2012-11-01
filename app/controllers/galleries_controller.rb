class GalleriesController < ApplicationController
  expose(:galleries) 
  expose(:gallery)
  expose(:images) {gallery.images}  
  def index
    galleries = Gallery.all
  end 
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
