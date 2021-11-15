require 'rspec'
require_relative './../../models/task'

describe Task do
  it 'returns all tasks' do
    task = Task.create(task_name: 'go to shop', description: 'at tesco', completed: true)

    result = Task.get_all_tasks

    expect(result).to eq([task])
  end
end
