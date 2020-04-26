require 'sinatra'
require 'sinatra/base'
require 'sysrandom/securerandom'
require_relative 'mastermind/game'
require 'sinatra/reloader' if development?

class MastermindApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
    set :session_secret, ENV.fetch('MASTERMIND_SESSION_SECRET') { SecureRandom.hex(64) }
  end

  set :root, 'lib/app'

  @@game = Game.new
  
  get '/' do
    session[:game] = @@game
    if @@game.win
      session[:message] = "You win!"
      message = session.delete(:message)
    end
    p session
    if @@game.game_over
      session[:message] = "Game Over!"
      message = session.delete(:message)
    end
    feedback = @@game.feedbacks
    erb :index, locals: { feedback: feedback, message: message }
  end

  post '/' do
    guess = params.values
    @@game.create_feedback(guess)
    redirect '/'
  end

  post '/start' do
    reset
    redirect '/'
  end

  def reset 
    @@game = Game.new
  end
end