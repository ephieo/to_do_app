require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra-cross_origin'
require 'json'

require_relative '../models/task'

class TodoApp < Sinatra::Base
  configure do
    set :views, Proc.new { File.join('app', "views") }
  end

  set :bind, "0.0.0.0"

  configure do 
    enable :cross_origin
  end

  before do 
    response.headers["Access-Control-Allow-Origin"] = "*"
  end

  get '/' do
    erb :'home/index', :layout => :'layouts/layout'
  end

  get '/all-tasks' do
    @tasks = JSON.parse(Task.get_all_tasks)
    erb :'tasks/all_tasks', :layout => :'layouts/layout'
  end
  get '/complete' do
    @tasks = JSON.parse(Task.get_all_completed_tasks)
    erb :'tasks/all_tasks', :layout => :'layouts/layout'
  end

  get '/incomplete' do
    @tasks = JSON.parse(Task.get_all_incomplete_tasks)
    erb :'tasks/all_tasks', :layout => :'layouts/layout'
  end

  post '/create-task' do
    @created_task = JSON.parse(Task.create_task(params))
  end

  options "*" do 
    options = "GET, PUT, POST, DELETE, OPTIONS"
    headers = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Allow"] = options
    response.headers["Access-Control-Allow-Headers"] = headers
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end



  run! if app_file == $0
end
