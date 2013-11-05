class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end

    private

    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
        root_path
    end

    def after_sign_in_path_for(resource_or_scope)
        user_path(current_user)
    end
 end
