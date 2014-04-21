require 'sinatra'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3' }

post '/ab/:feature_name' do |feature_name|
  test = Test.new(name: feature_name)
  test.choices.build(params[:choices])
  test.save
end

get '/ab/:feature_name/:user_id' do |feature_name, user_id|
  test = Test.includes(:choices).find_by(name: feature_name)
  test.users_choices.find_by(user_id: user_id) ||
  test.choose_for_user(user_id)
end
