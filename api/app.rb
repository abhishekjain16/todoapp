require 'bundler'
require "sinatra/activerecord"
require './models/task'
require "sinatra/reloader"

Bundler.require


set :database_file, "config/database.yml"

get '/' do
  redirect '/task'
end

get '/tasks' do
  Task.order(start_time: :desc).to_json
end


get '/tasks/:id' do |id|
  Task.where(id: id).first.to_json
end

post '/tasks' do
  task = Task.new(params[:task])
  task.save
  task.to_json
end

put '/tasks/:id' do |id|
  task = Task.where(id: id).first
  task.update_attributes(params[:task])
  task.to_json
end

delete '/tasks/:id' do |id|
  task = Task.where(id: id).first
  task.destroy
  task.to_json
end
