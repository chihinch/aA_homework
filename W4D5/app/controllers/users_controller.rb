class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    # Create a new User object from the strong params
    @user = User.new(user_params)

    # Attempt to save this user to the database. If successful, login the user and redirect to its page.
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  private

  # Allow only email and password params to be passed in from the form
  def user_params
    params.require(:user).permit(:email, :password)
  end
end