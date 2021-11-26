require 'sinatra'
require 'sinatra/activerecord'
require 'json'

require_relative '../models/task'

class TodoApp < Sinatra::Base


  configure do
    set :views, Proc.new { File.join('app', "views") }
  end

  get '/' do
    "home"
  end

  get '/all-tasks' do
   Task.get_all_tasks
  end
  get '/complete' do
    Task.get_all_completed_tasks
  end

  get '/incomplete' do
    Task.get_all_incomplete_tasks
  end

  post '/create-task' do
    Task.create_task(params)
  end

  run! if app_file == $0
end
