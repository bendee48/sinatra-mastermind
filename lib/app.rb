# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sysrandom/securerandom'
require_relative 'mastermind/game'
require 'sinatra/reloader' if development?

# Class to hold app
class MastermindApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
    session_key = 'MASTERMIND_SESSION_SECRET'
    set :session_secret, ENV.fetch(session_key) { SecureRandom.hex(64) }
  end

  set :root, 'lib/app'

  @@game = Game.new

  get '/' do
    session[:game] = @@game
    if @@game.win
      session[:message] = 'You win!'
      message = session.delete(:message)
    end
    if @@game.game_over
      session[:message] = 'Game Over!'
      message = session.delete(:message)
    end
    feedback = @@game.feedbacks
    turns = @@game.turns
    erb :index, locals: { feedback: feedback, message: message, turns: turns }
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

  get '/instructions' do
    erb :instructions
  end

  def reset
    @@game = Game.new
  end
end
