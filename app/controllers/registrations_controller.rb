class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    # redirect_back fallback_location: root_path
  end

end
