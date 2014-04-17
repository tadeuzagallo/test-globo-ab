require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite://db/development.sqlite3'

get '/' do
  'Hello World!'
end
