require 'sinatra'
require 'sinatra/activerecord'

class TodoApp < Sinatra::Base

  configure do 
    # set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join('app',"views") }
  end 


    get '/erb' do
      puts Dir.pwd
      code = "<h1>Welcome!</h1> "
        erb code
    end
    get '/views' do
      puts Dir.pwd
      puts File.dirname(__FILE__)
      puts  Proc.new { File.join('app',"views") }
      puts  Proc.new { File.join(root,'app',"views") }
      erb :'home/index'
    end

    get '/' do
      puts Dir.pwd
      "you better work"
    end 
  run!
 
end