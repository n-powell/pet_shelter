require 'sinatra'
require 'sinatra/reloader'
require './lib/person'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
