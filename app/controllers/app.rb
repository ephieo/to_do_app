require 'sinatra'
require 'sinatra/activerecord'
require 'json'

require_relative '../models/task'

class TodoApp < Sinatra::Base

  configure do 
    set :views, Proc.new { File.join('app',"views") }
  end 
  
    get '/' do
      erb :'home/index', :layout => :'layouts/layout'
    end 
   

    get '/all-tasks' do
      # @task = params[:status]
      @tasks = Task.get_all_tasks
      erb :'tasks/all_tasks', :layout => :'layouts/layout'
    end
  run!
 
end