# require 'rack'

require 'bundler'
Bundler.require
require './app/controllers/app.rb'

require File.expand_path('../config/environment',__FILE__)

run TodoApp
# class HelloRack
#     def call(env)
#         [200, {"Content-Type" => "text/html"}, [TodoApp]]
#     end
# end


# run HelloRack.new


# $LOAD_PATH.unshift(File.expand_path("app",__dir__))

