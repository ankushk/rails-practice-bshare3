class UsersController < ApplicationController
  
  def new
    #byebug
    if current_user
      @user = current_user
      redirect_to root_url
    else
      @user = User.new
      render "new"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def index
    if current_user
      @user = current_user
    else
      redirect_to sign_up_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:userid, :password, :password_confirmation)
    end
end
