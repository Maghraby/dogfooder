# frozen_string_literal: true

rails_env = Rails.env || 'development'
sidekiq_config = Rails.application.config_for('sidekiq').with_indifferent_access

Sidekiq.configure_server do |config|
  config.redis = {
    url: "redis://#{sidekiq_config[:host]}:#{sidekiq_config[:port]}/#{sidekiq_config[:db]}",
    namespace: "sidekiq_#{rails_env}"
  }

end

Sidekiq.configure_client do |config|
  config.redis = {
    url: "redis://#{sidekiq_config[:host]}:#{sidekiq_config[:port]}/#{sidekiq_config[:db]}",
    namespace: "sidekiq_#{rails_env}"
  }
end

require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |username, password|
  [username, password] == [Dogfooder::Application::HTTP_AUTH_USERNAME, Dogfooder::Application::HTTP_AUTH_PASSWORD]
end
