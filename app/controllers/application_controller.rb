# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    # 新規登録時に許可するパラメーター
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :birth_date])

    # プロファイル更新時に許可するパラメーター
    #devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :email, :password, :password_confirmation, :current_password, :last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :birth_date])
  end
end


