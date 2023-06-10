# frozen_string_literal: true
class Users::SessionsController < Devise::SessionsController
include JwtHelper
  # before_action :configure_sign_in_params, only: [:create]
  def new
    super
  end

  def after_sign_in_path_for(resource_or_scope)
    session["user_id"] = current_user.id
    secret = Rails.application.credentials.jwt_secret
    token = generate_jwt_token(session.to_h)        
    message = {"command":"login","device_id":session[:device_id],"data":token}
    ActionCable.server.broadcast 'control_channel',message
    organization_admin_path
  end 

  def after_sign_out_path_for(resource_or_scope)
    "/home"
  end 

  def destroy
    super
  end

  # def destroy
  #     super do
  #       # Turbo requires redirects be :see_other (303); so override Devise default (302)
  #       return redirect_to after_sign_out_path_for(resource_name), status: :see_other
  #     end
  #   end

  # def respond_to_on_destroy
  #   respond_to do |format|
  #     format.all { head :no_content }
  #     format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name), status: :see_other}
  #   end
  # end


  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
