require 'sinatra'
require 'sinatra/cross_origin'
require 'sinatra/activerecord'
require 'json'

require_relative '../models/task'

class TodoApp < Sinatra::Base

  configure do
    set :views, Proc.new { File.join('app', "views") }
  end

  before do 
    response.headers["Access-Control-Allow-Origin"] = "*"
  end
  
  set :bind, "0.0.0.0"

  configure do 
    enable :cross_origin
  end

  get '/' do
    "home"
  end

  get '/all-tasks' do
   Task.get_all_tasks
  end
  get '/complete-tasks' do
    Task.get_all_completed_tasks
  end

  get '/incomplete-tasks' do
    Task.get_all_incomplete_tasks
  end

  post '/create-tasks' do
    Task.create_task(params)
  end

  options "*" do 
    types = "GET, PUT, POST, DELETE, OPTIONS"
    headers = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Allow"] = types
    response.headers["Access-Control-Allow-Headers"] = headers
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end

  run! if app_file == $0
end
