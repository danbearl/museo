class PostsController < ApplicationController
  expose(:posts) {Post.order("created_at DESC")}
  expose(:post)

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "Post successfully created."
    else
      render "new"
    end
  end

  def update
    if Post.find(params[:id]).update_attributes(post_params)
      redirect_to posts_path, notice: "Post successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    post.destroy
    redirect_to posts_path, notice: "Post successfully deleted."
  end

  private
  
  def post_params
    params.require(:post).permit(:body, :title)
  end

end
