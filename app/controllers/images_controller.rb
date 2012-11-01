class ImagesController < ApplicationController

  expose(:image, :model => Image)
  expose(:images)
  expose(:gallery)
  expose(:owner) {image.gallery}
  def new
  end

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

  def show
  end

  def destroy
    image.destroy
    redirect_to gallery, notice: "Image successfully deleted."
  end

  def move
  end
end
