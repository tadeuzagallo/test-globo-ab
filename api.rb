require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'sinatra/reloader' if development?

$LOAD_PATH.concat(%w{./app/models ./app/serializers})

require 'test'
require 'user_choice_serializer'

ENV['RACK_ENV'] ||= 'development'

set :database, { adapter: 'sqlite3', database: "db/#{ENV['RACK_ENV']}.sqlite3" }

post '/ab/:feature_name' do |feature_name|
  test = Test.new(name: feature_name)
  test.choices.build(params[:choices])
  test.save
end

get '/ab/:feature_name/:user_id' do |feature_name, user_id|
  test = Test.includes(:choices).find_by(name: feature_name)
  if test.present?
    user_choice = test.users_choices.find_by(user_id: user_id) ||
    test.choose_for_user(user_id)

    json UserChoiceSerializer.new(user_choice, root: nil)
  else
    json_halt(401, message: 'Test not found')
  end
end

private
def json_halt(code, content)
  halt code, { 'Content-Type' => 'application/json' }, JSON.dump(content)
end
