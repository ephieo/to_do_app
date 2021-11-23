require 'sinatra'
require 'sinatra/activerecord'
require 'json'

require_relative '../models/task'

class TodoApp < Sinatra::Base
  configure do
    set :views, Proc.new { File.join('app', "views") }
  end

  get '/' do
    erb :'home/index', :layout => :'layouts/layout'
  end

  # get '/all-tasks/:id/:name' do 
  #   puts params
  # end

  get '/all-tasks' do
    @tasks = JSON.parse(Task.get_all_tasks)
    puts @tasks
    puts params
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
  run! if app_file == $0
end
