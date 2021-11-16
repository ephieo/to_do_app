require 'sinatra'
require 'sinatra/activerecord'

class Task < ActiveRecord::Base
  def self.get_all_tasks
    Task.all
  end

  def self.get_all_completed_tasks
    Task.find_by(completed: true)
  end
end
