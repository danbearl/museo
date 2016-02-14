class PagesController < ApplicationController

  expose(:pages)
  expose(:page, finder: :find_by_slug, finder_parameter: :slug)

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to slug_path(@page.slug), notice: "Page successfully created."
    else
      render 'new'
    end
  end

  def update
    if Page.find_by_slug(params[:slug]).update_attributes(page_params)
      redirect_to slug_path(params[:slug]), notice: "Page successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    page.destroy
    redirect_to :root, notice: "Page successfully deleted."
  end

  private

  def page_params
    params.require(:page).permit(:body, :name, :slug, :priority)
  end

end
