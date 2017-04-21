class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "Invalid"
      redirect_to new_user_url
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to users_url
    else
      flash.now[:errors] = "error"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
