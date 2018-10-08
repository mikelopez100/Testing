require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/dogs.db")

class Dog
	include DataMapper::Resource
	property :id, Serial
	property :name, Text
	property :breed, Text
	property :weight, Integer
end

DataMapper.finalize
Dog.auto_upgrade!

# #display the name and breed and weight of every dog
# get '/dogs' do

# end

# #create a new dog
# post '/dogs' do

# end

# #update an existing dog, given its id and new information
# patch '/dogs' do

# end

# #delete a dog, given its id
# delete '/dogs' do

# end