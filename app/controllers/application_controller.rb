class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :store_user_location!, if: :storable_location?
  after_action :store_action

  check_authorization unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_back fallback_location: root_path, alert: "Sorry, you are not authorized to access that action or page. Please contact us to resolve this."
    else
      redirect_to new_user_session_path, alert: "Please login or create your account to continue."
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_back fallback_location: root_path, alert: "Sorry, we cannot locate the page you're looking for. Please try another."
  end

  # rescue_from CanCan::AuthorizationNotPerformed do |exception|
  #   if current_user.nil?
  #     session[:next] = request.fullpath
  #     redirect_to login_url, alert: 'You have to log in to continue.'
  #   else
  #     # render file: "#{Rails.root}/public/403.html", status: 403
  #     redirect_back(fallback_location: root_path)
  #   end
  # end

  def store_action
    return unless request.get?
    if (request.path != "/sessions/sign_in" &&
        request.path != "/sessions/sign_up" &&
        request.path != "/sessions/password/new" &&
        request.path != "/sessions/password/edit" &&
        request.path != "/sessions/confirmation" &&
        request.path != "/sessions/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end

  def storable_location?
     request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
   end

   def store_user_location!
     # :user is the scope we are authenticating
     store_location_for(:user, request.fullpath)
   end


  protected

  def after_sign_in_path_for(resource_or_scope)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
     super
    else
     stored_location_for(resource) || request.referer || root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end


end
