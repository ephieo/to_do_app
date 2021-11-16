require 'spec_helper'
require 'rspec'
require_relative './../../app/models/task'

describe Task do
  it 'returns all tasks' do
    task = Task.create(task_name: 'go to shop', description: 'at tesco', completed: true)

    result = Task.get_all_tasks

    expect(result).to eq([task])
  end
  it 'returns all complted tasks' do
    task = Task.create(task_name: 'go to football game', description: 'at wembley', completed: true)

    result = Task.get_all_completed_tasks

    expect(result).to eq(task)
  end
end
