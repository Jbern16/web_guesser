require 'pry'
require 'sinatra'
require 'sinatra/reloader'

@@secret_number = rand(100)
@@guess_counter = 5

get '/' do
  guess = params["guess"].to_i
  cheat = params["cheat"]
  message = check_guess(guess)
  color = background(message)
  erb :index, :locals => {number: @@secret_number, message: message, color: color}
end

def check_guess(guess)
  if @@guess_counter == 0
    reset_game
    "You lose. You ran out of guesses, a new number has been generated"
  else
    @@guess_counter -= 1
    guess_checker(guess)
  end
end

def guess_checker(guess)
  if params["cheat"] == "true"
    "#{@@secret_number}"
  elsif guess <=0
    "Guess a number b/w 1 and 100"
  elsif guess - @@secret_number > 5
    "Way too high!"
  elsif @@secret_number - guess  > 5
    "Way too low!"
  elsif guess < @@secret_number
    "Too Low!"
  elsif guess > @@secret_number
    "Too High!"
  elsif guess == @@secret_number
    victory
  end
end

def victory
  reset_game
  "You are correct! The SECRET_NUMBER is #{@@secret_number} Go Again"
end

def reset_game
  @@secret_number = rand(100)
  @@guess_counter = 5
end

def background(message="white")
  if message.downcase.include?("way")
    "red"
  elsif message.downcase.include?("too")
    "pink"
  elsif message.downcase.include?("correct")
    "green"
  end

end
