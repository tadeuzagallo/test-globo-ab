require 'active_record'
require 'yaml'

APP_ENV = ENV['APP_ENV'] || 'development'

ActiveRecord::Base.establish_connection(
  YAML.load_file('database.yml')[APP_ENV]
)
