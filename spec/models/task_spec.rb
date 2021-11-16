require 'spec_helper'
require 'rspec'

require 'simplecov'
SimpleCov.start

require_relative './../../app/models/task'

describe Task do
  it 'returns all tasks' do
    task = Task.create(task_name: 'go to shop', description: 'at Tesco', completed: true)

    result = Task.get_all_tasks

    expect(result).to eq([task])
  end
  it 'returns all completed tasks' do
    task = Task.create(task_name: 'go to football game', description: 'at Wembley', completed: true)

    result = Task.get_all_completed_tasks

    expect(result).to eq(task)
  end
  it 'returns all tasks that are not completed' do
    task = Task.create(task_name: 'catch up with Potter', description: 'meeting at Hogwarts', completed: false)

    result = Task.get_all_incomplete_tasks

    expect(result).to eq(task)
  end
end