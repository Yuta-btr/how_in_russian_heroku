class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログインしていない場合、ログイン画面を返すDeviseのヘルパー
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:name, :profile_img, :nationality, :introduction, :website])
    devise_parameter_sanitizer.permit(:account_update,
      keys: [:name, :profile_img, :nationality, :introduction, :website])
  end

end
