require 'sinatra'
require 'data_mapper'

# need install dm-sqlite-adapter
# if on heroku, use Postgres database
# if not use sqlite3 database I gave you
if ENV['DATABASE_URL']
	DataMapper::setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
  else
	DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")
  end

class Post
	include DataMapper::Resource
	property :id, Serial
	property :title, Text
	property :body, Text
	property :created_at, DateTime
end

DataMapper.finalize
Post.auto_upgrade!

#display the title and body of every post as JSON
get '/posts' do

end

#create a new posts
post '/posts' do

end

#update an existing post, given its id and new information
patch '/posts' do

end

#delete a posts, given its id
delete '/posts' do

end