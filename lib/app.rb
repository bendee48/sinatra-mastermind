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
    p @@game.win
    feedback = @@game.feedbacks
    erb :index, locals: { feedback: feedback }
  end

  post '/' do
    guess = params.values
    @@game.create_feedback(guess)
    redirect '/'
  end

  post '/start' do
    @@game = Game.new
    redirect '/'
  end
end