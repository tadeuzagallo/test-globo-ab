require 'sinatra'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3' }

post '/ab/:feature_name' do |feature_name|
  test = Test.new(name: feature_name)
  test.choices.build(params[:choices])
  test.save
end
