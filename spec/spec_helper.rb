$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'models'))

RSpec.configure do |config|
  require 'api'
  require 'shoulda/matchers'
  require 'capybara/rspec'
  require 'rack/test'
  require 'i18n'

  I18n.enforce_available_locales = true

  Capybara.app = Sinatra::Application
  Capybara.app.environment = :test

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
  config.include Capybara::DSL
end
