class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i(guest_sign_in)
  before_action :set_user, only: %i(show edit update destroy)
  before_action :correct_user, only: %i(show edit update destroy)
  skip_before_action :authenticate_user!, only: %i(guest_sign_in)

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
      redirect_to @user, notice: 'プロフィールが更新されました！'
    else
      render :edit
    end
  end
  

  def destroy
    @user.destroy
    redirect_to new_user_session_path, notice: 'アカウントが削除されました！'
  end

  # ゲストログイン(一般ユーザー)のアクション
  def guest_sign_in
    guest_user = find_or_create_guest_user
    sign_in guest_user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    unless current_user == @user
      redirect_to root_path, alert: '他のユーザーの情報にアクセスすることはできません！'
    end
  end

  def user_params
    params.require(:user).permit(:admin, :phone_number, :email, :name, :password, :password_confirmation)
  end
end

def find_or_create_guest_user
  User.find_or_create_by!(email: 'guest@example.com') do |user|
    user.name = "guest"
    user.phone_number = "00000000000"
    user.password = SecureRandom.urlsafe_base64
  end
end