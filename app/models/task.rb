require 'sinatra'
require 'sinatra/activerecord'

class Task < ActiveRecord::Base
  def self.get_all_tasks
    Task.all
  end

  def self.get_all_completed_tasks
    Task.find_by(completed: true)
  end
  def self.get_all_incomplete_tasks
    Task.find_by(completed: false)
  end
end
