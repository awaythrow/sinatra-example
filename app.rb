require 'dotenv/load'
require 'sinatra'
require 'sinatra/activerecord'
require 'awesome_print'
#https://github.com/awesome-print/awesome_print/issues/137
require 'active_support/core_ext/string/output_safety'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

configure { set :server, :puma }


class App < Sinatra::Base

  get "/" do
    erb :index
  end

  get '/users' do
    users = Users.all
    erb :users, :locals => { users: users }
  end

  get '/users/:id' do
    user = Users.find(params[:id])
    erb :users, :locals => { users: [user] }
  end

  post '/users' do
    user = Users.create(params)
    erb :users, :locals => { users: [user] }
  end

  delete '/users/:id' do
    Users.destroy(params[:id])
    "deleted #{params[:id]}"
  end

end
