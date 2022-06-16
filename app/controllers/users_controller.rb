class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path
    else
      render :new
    end    
  end

  private
  
  def user_params
    params.require(:user).permit(:title, :email, :password, :password_confirmation)
  end

  def check_email_uniq(email)
    User.find_by(email: email)
  end

end
