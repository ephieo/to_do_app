require 'sinatra'
require 'sinatra/activerecord'

class Task < ActiveRecord::Base
  def self.get_all_tasks
    Task.all
  end
end
