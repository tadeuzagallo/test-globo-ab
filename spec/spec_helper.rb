$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'models'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'serializers'))

RSpec.configure do |config|
  require 'api'
  require 'shoulda/matchers'
  require 'capybara/rspec'
  require 'rack/test'
  require 'i18n'
  require 'factory_girl'
  require 'database_cleaner'

  I18n.enforce_available_locales = true

  Capybara.app = Sinatra::Application
  Capybara.app.environment = :test

  FactoryGirl.definition_file_paths = %w{./spec/factories}
  FactoryGirl.find_definitions

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
  config.include Capybara::DSL

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
end
