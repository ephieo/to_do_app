require 'spec_helper'
require 'rspec'
require 'json'

require_relative './../../app/models/task'

describe Task do
  it 'returns all tasks' do
    task = Task.create(task_name: 'go to shop', description: 'at Tesco', completed: true)

    result = Task.get_all_tasks

    expect(result).to eq([task].to_json)
  end
  it 'returns all completed tasks' do
    task = Task.create(task_name: 'go to football game', description: 'at Wembley', completed: true)

    result = Task.get_all_completed_tasks

    expect([task].to_json).to eq(result)
  end
  it 'returns all tasks that are not completed' do
    task = Task.create(task_name: 'catch up with Potter', description: 'meeting at Hogwarts', completed: false)

    result = Task.get_all_incomplete_tasks

    expect([task].to_json).to eq(result)
  end

  it 'takes the id from params as an argument and saves a new task to the table' do 
    params = {task_name: 'Go for a swim', description: 'In the River Thames', completed: true}
    Task.create_task(params)

    result = Task.get_all_tasks

    expect(result).to include('Go for a swim')
  end 

  it 'returns an error when passed an empty hash' do 
    params = {}
    
    result = Task.create_task(params)

    expect(result).to include('Task name can\'t be blank')
  end 

end
