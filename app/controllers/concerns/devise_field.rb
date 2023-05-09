module DeviseField
  extend ActiveSupport::Concern

  included do
    before_action :configured_permitted_parameters, if: :devise_controller?
  end
  def configured_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end