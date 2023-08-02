class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # # def create
  # #   binding.pry
  # # end

  # private
  # def configure_permitted_parameters
  #   #sign_up（新規登録の処理）に対して、nicknameというキーのパラメーターを新たに許可
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :name, :profile, :occupation, :position])
  #   # binding.pry

  # end
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :profile, :occupation, :position])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
