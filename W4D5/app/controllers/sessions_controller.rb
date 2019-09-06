class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    # Attempt to find the user
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    # If the user is found, log in. Otherwise, flash an invalid credentials error
    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Invalid email/password combination"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end