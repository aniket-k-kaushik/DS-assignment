class ApplicationController < ActionController::Base
  include DeviseField

  before_action :authenticate_user!
end
