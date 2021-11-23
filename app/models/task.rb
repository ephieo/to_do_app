class Task < ActiveRecord::Base
  def self.get_all_tasks
    Task.all.to_json
  end

  def self.get_all_completed_tasks
    Task.where(completed: true).to_json
  end

  def self.get_all_incomplete_tasks
    Task.where(completed: false).to_json
  end

  def self.create_task(params) 
    task = Task.new(params)

    if task.save 
      task.to_json
    else 
      halt 422, task.errors.full_messages.to_json
    end

  end

end
