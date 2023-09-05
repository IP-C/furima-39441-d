require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Furima39441D
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Basic認証を有効にするためのコード
    config.middleware.use Rack::Auth::Basic do |username, password|
      # 環境変数からユーザー名とパスワードを取得
      correct_username = ENV['BASIC_AUTH_USERNAME']
      correct_password = ENV['BASIC_AUTH_PASSWORD']

      # ユーザー名とパスワードが一致するか確認
      username == correct_username && password == correct_password
    end
  end
end
