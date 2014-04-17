require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:db/development.sqlite3'

get '/' do
  'Hello World!'
end
