class ApplicationController < ActionController::Base
  before_action :authenticate_user!, if: :route_with_protection?
  # Pundit
	include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    if current_user.is_admin?
      dashboard_path
    else
      if current_user.profile.present?
        root_path
      else
        new_profile_path
      end
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

    def route_with_protection?
      controller_name != 'home'
    end

    def user_not_authorized
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to root_path
    end
end
