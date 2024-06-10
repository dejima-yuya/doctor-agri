class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, except: %i(guest_admin_sign_in)
  before_action :check_admin, except: %i(guest_admin_sign_in)
  before_action :set_user, only: %i(show edit update destroy)

  def index
    if params[:keyword].present?
      @users = User.search_by_name(params[:keyword]).page(params[:page]).per(10).order(created_at: :DESC)
    else
      @users = User.page(params[:page]).per(10).order(created_at: :DESC)
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
      redirect_to admin_user_url(@user), notice: 'アカウントが登録されました！'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: 'ユーザ情報が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_url, notice: 'ユーザが削除されました。'
    else
      redirect_to admin_users_url, alert: @user.errors.full_messages.to_sentence
    end
  end

  # ゲスト管理者としてログインするためのアクション
  def guest_admin_sign_in
    # ゲスト管理者ユーザーを見つける、もし存在しなければ作成する
    user = User.find_or_create_by!(name: "guest_admin", phone_number: "00000000000", email: 'guest_admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
    sign_in user
    redirect_to sub_top_index_path, notice: 'ゲスト管理者としてログインしました。'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
