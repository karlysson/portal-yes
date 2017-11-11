class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :advertising_categories
  protect_from_forgery with: :exception

  layout Proc.new { |controller| controller.devise_controller? ? 'layouts/login/application' : 'layouts/site/application' }

  # devise
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def advertising_categories
	@advertising_categories = AdvertisingCategory.all
  end


end
