class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email].downcase)

    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_back_or_to(root_path, notice: "Successfully signed in.")
    else
      flash.now.alert = "Your email and password do not match."
      render :new
    end
  end

  def destroy
    sign_out_user
    redirect_to(:root, notice: "User signed out successfully.")
  end

end
