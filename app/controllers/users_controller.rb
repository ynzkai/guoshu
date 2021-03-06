class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update, :avatar]

  def index
    @users = User.all.reverse
  end

  def show
    @user = User.find params[:id]
  end

  def update
    if current_user.update avatar: params[:user][:avatar]
      redirect_to avatar_path, notice: "修改头像成功."
    else
      render :show, alert: "修改头像失败!"
    end
  end

  def avatar
  end

end
