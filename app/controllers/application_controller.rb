class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authorize_admin
    return if can?(:manage, :all)

    flash[:error] = 'You have no access to the requested page'
    redirect_to products_path
  end
end
