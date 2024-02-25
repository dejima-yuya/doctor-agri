class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
    if params[:keyword].present?
      @users = User.search_by_name(params[:keyword]).page(params[:page]).per(10)
    else
      @users = User.page(params[:page]).per(10)
    end
  end

  def show
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_url, notice: 'アカウントが登録されました！'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_url, notice: 'ユーザ情報が更新されました！'
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_url, notice: 'ユーザが削除されました！'
    else
      redirect_to admin_users_url, alert: @user.errors.full_messages.to_sentence
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
