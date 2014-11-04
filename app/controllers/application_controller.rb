class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_order

  rescue_from CanCan::AccessDenied, with: :access_denied

  def current_order
    return nil unless signed_in?

    @current_order ||= Order.draft.where(user_id: current_user.id).first_or_create
  end

  private

  def access_denied
    flash[:error] = 'You have no access to the requested page'
    redirect_to products_path
  end
end
