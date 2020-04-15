require 'sinatra'
require 'sinatra/base'
require 'sysrandom/securerandom'
require 'sinatra/reloader' if development?

class MastermindApp < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
    enable :sessions
    set :session_secret, ENV.fetch('MASTERMIND_SESSION_SECRET') { SecureRandom.hex(64) }
  end

  set :root, 'lib/app'

  get '/' do
    erb :index
  end

  post '/' do 
    p params
    "got your guess"
  end
end