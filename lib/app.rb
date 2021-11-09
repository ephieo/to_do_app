require 'sinatra'
require 'sinatra/activerecord'
require 'pg'
require_relative './../models/task'

get "/tasks" do
  Task.all.to_json
end
