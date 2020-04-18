require 'sinatra'
require 'sinatra/base'
require 'sysrandom/securerandom'
require_relative 'mastermind/colors'
require 'sinatra/reloader' if development?

class MastermindApp < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
    enable :sessions
    set :session_secret, ENV.fetch('MASTERMIND_SESSION_SECRET') { SecureRandom.hex(64) }
  end

  set :root, 'lib/app'

  @@colors = Colors.new

  get '/' do
    p @@colors
    colors = @@colors.selected.reverse
    erb :index, locals: { colors: colors }
  end

  post '/' do 
    @@colors.add_colors(params.values)
    params.values
    redirect '/'
  end
end