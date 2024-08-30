# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  prepend_before_action :require_no_authentication, only: [:new, :create]
  prepend_before_action :allow_params_authentication!, only: :create

  # GET /resource/sign_in
  def new
      self.resource = User.new(sign_in_params)
      clean_up_passwords(resource)
      yield resource if block_given?
  end

# POST /resource/sign_in
  def create
      # reproduce from super https://github.com/heartcombo/devise/blob/main/app/controllers/devise/sessions_controller.rb
      request.env["devise.skip_timeout"] = true

      # warden auth
      self.resource = warden.authenticate!(auth_options)

      # feedback sent to user on successful auth
      flash.notice = t("flashes.log_in", user: resource.username)
      # start session, log in DB, etc.
      sign_in(resource_name, resource)

      yield resource if block_given?

      # redirect to home page on success
      respond_with resource, location: root_path
  end

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
