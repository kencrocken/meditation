class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActionController::ParameterMissing, :with => :parameter_missing

  private

  def parameter_missing
    flash[:notice] = "Please select the duration of your session."
    redirect_to root_path
  end
end
