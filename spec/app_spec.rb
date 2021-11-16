require 'spec_helper'
require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative './../app/models/task'

describe Task, 'completed' do
  # it ' returns only completed tasks' do
  #   # setup
  #   completed_task = Task.create(task_name: 'walk dog', description: 'in the park', completed: true)
   

  #   # excercise
  #   result = Task.where(completed: true).first.to_json

  #   # verify
  #   expect(result).to eq[completed_task]
  # end
end
