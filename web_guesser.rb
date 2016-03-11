require 'sinatra'
require 'sinatra/reloader'

get '/' do
  num = rand(100)
  "THE SECRET NUMBER IS #{num}"
end
