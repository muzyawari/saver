class ApplicationController < ActionController::Base
  before_action :demo_user
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    @user = current_user
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :phone, :gender, :dob])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :phone, :gender, :dob, :bg_color, :card_color, :txt_color])
  end

  def default_url_options
<<<<<<< HEAD
    { host: ENV["https://www.monosaver.com/"] || "localhost:3000" }
=======
    { host: ENV["https://www.monosaver.com/"] }
>>>>>>> 1035669371fb50c66843fe286ffcbe2662c84274
  end

  # set Signout
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def demo_user
    @demo = User.find(5)
  end
end
