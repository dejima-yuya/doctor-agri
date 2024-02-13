class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number])
  end

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.admin?
      surveys_path # 管理者の場合はアンケート一覧ページへリダイレクト
    else
      super # それ以外のユーザーの場合はDeviseのデフォルトのリダイレクト先
    end
  end
  
end
