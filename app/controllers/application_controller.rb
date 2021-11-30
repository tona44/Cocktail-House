class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    case resource
      when User
        cocktails_path
      when AdminUser
        stored_location_for(resource) ||
        if resource.is_a?(AdminUser)
          admin_root_path
        else
          super
        end
    end
  end

  def after_sign_out_path_for(resouce)
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image])
  end

end
