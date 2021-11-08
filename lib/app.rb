require 'sinatra'
require 'sinatra/activerecord'
require 'pg'

connection = PG.connect(dbname: 'todo_dev_db', user: 'ephieoyedoh')
rows = connection.exec("select * from todo_list")

get '/' do
    rows.each {|row| puts row[task_name]}
end