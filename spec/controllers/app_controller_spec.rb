require 'spec_helper'
require 'rspec'
require 'rack/test'

require_relative './../../app/controllers/app_controller'

describe TodoApp, :type => :controller  do
  include Rack::Test::Methods
  subject(:todo_app) {TodoApp.new}
  
  def app
    Sinatra::Application
  end

context 'GET to /' do 
    # let(:response) {get '/'}
    
    it 'says HOMEPAGE!' do
      get '/'
      expect(response).to render_template('index')
    #    get '/'
    #    puts last_response 
    end
end
 

  it 'shows all tasks' do
    # let(:response) {get '/all-tasks'}
  end

  it 'shows all completed tasks' do
    get '/complete'
  end

  it 'shows all incomplete tasks' do
    get '/incomplete'
  end
end
