require 'sinatra'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3' }

post '/ab/:feature_name' do |feature_name|
  Test.create(name: feature_name)
end
