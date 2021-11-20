require 'spec_helper'
require 'rspec'
require 'rack/test'
require 'json'

require_relative './../../app/controllers/app_controller'
require_relative './../../app/models/task'

describe TodoApp, :type => :controller do
  include Rack::Test::Methods

  def app
    TodoApp.new
  end

  before do
    incomplete_task = [{ "id" => 3, "task_name" => "go to the cinema","description" => "at odeon", "completed" => false, "created_at" => "2021-11-16T15:24:21.734Z" }].to_json
    completed_task = [{ "id" => 4, "task_name" => "go for a walk","description" => "at greenwich park", "completed" => true, "created_at" => "2021-11-16T15:24:21.734Z" }].to_json
    allow(Task).to receive(:get_all_tasks).and_return(completed_task)
    allow(Task).to receive(:get_all_incomplete_tasks).and_return(incomplete_task)
    allow(Task).to receive(:get_all_completed_tasks).and_return(completed_task)
  end

  it 'says HOMEPAGE!' do
    get '/'
    expect(last_response.body).to include('HOMEPAGE')
  end

  it 'shows all tasks' do
    get '/all-tasks'
    puts last_response.body
    expect(last_response.body).to include('at greenwich park')
  end

    it 'shows all completed tasks' do
      get '/complete'
      expect(last_response.body).to include('at greenwich park')
    end

    it 'shows all incomplete tasks' do
      get '/incomplete'
      expect(last_response.body).to include('go to the cinema')
    end
end