class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActionController::ParameterMissing, :with => :parameter_missing
  add_flash_types :success, :error

  private

  def parameter_missing
    flash[:error] = "Sorry there was an error."
    redirect_to root_path
  end
end
