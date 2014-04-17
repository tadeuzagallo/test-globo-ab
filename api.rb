require 'sinatra'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3' }

get '/' do
  'Hello World!'
end
