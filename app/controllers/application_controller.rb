class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def guest_user?
    current_user&.email == "guest@example.com"
  end

  def reject_guest_user
    if current_user&.guest?
      redirect_to root_path, alert: "ゲストユーザーは閲覧のみです"
    end
  end
end