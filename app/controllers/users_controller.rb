class UsersController < ApplicationController

  def new
  end

  def create

    user = User.new(user_paramd)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email, :first_name, :last_name)
  end

end