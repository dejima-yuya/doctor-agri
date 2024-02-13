class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  
    if @user.update(user_params)
      bypass_sign_in(@user) # ユーザーを再認証
      redirect_to @user, notice: 'ユーザー情報が更新されました。'
    else
      render :edit
    end
  end
  

  def destroy
    @user.destroy
    redirect_to new_user_session_path, notice: 'ユーザーが削除されました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    unless current_user == @user
      redirect_to root_path, alert: '他のユーザーの情報にアクセスすることはできません。'
    end
  end

  def user_params
    params.require(:user).permit(:admin, :phone_number, :email, :name, :password, :password_confirmation)
  end
end
