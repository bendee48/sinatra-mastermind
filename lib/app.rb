require 'sinatra'
require 'sinatra/base'
require 'sysrandom/securerandom'
require_relative 'mastermind/feedback'
require 'sinatra/reloader' if development?

class MastermindApp < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
    enable :sessions
    set :session_secret, ENV.fetch('MASTERMIND_SESSION_SECRET') { SecureRandom.hex(64) }
  end

  set :root, 'lib/app'

  @@code = ['red', 'cyan', 'black', 'magenta']

  get '/' do
    feedback = Feedback.all
    erb :index, locals: { feedback: feedback }
  end

  post '/' do
    guess = params.values
    feedback = Feedback.result(@@code, guess)
    session[:feedback] = Feedback.new(guess, feedback)
    redirect '/'
  end

  post '/start' do
    redirect '/'
  end
end