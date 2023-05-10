class ApplicationController < ActionController::Base
  include DeviseField
  include Pundit::Authorization

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path, alert: 'Only admins have access to this page'
  end
end
