require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {number: SECRET_NUMBER, message: message}
end

def check_guess(guess)
  if guess - SECRET_NUMBER > 5
    "Way too high!"
  elsif SECRET_NUMBER - guess  < 5
    "Way too low!"
  elsif guess < SECRET_NUMBER
    "Too Low!"
  elsif guess > SECRET_NUMBER
    "Too High!"
  elsif guess == SECRET_NUMBER
    "You are correct! The SECRET_NUMBER is #{SECRET_NUMBER}"
  end
end
