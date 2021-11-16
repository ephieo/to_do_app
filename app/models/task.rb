require 'sinatra'
require 'sinatra/activerecord'

class Task < ActiveRecord::Base
  def self.get_all_tasks
    Task.all.to_json
  end

  def self.get_all_completed_tasks
    Task.find_all_by(completed: true).limit(10).to_json
  end

  def self.get_all_incomplete_tasks
    Task.find_all_by(completed: false).limit(10).to_json
  end
end
# <% @task.each do |task| %>
#   <h2><%=task.task_name%></h2>
#   <h2><%=task.description%></h2>
#   <% end %>
# <h1>all tasks = <%= @task %></h1>
