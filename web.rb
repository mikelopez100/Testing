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
		halt 200, Post.all.to_json
end

get "/posts/:id" do
	p = Post.get(params["id"])
	if !p.nil?
		halt 200, p.to_json
	else
		halt 404, {"message" => "Post not found."}.to_json
	end
end

#create a new posts
post '/posts' do
	title = params["title"]
	body = params["body"]
	newPost = Post.new
	newPost.body = body
	newPost.title = title
	newPost.save

	halt 201, newPost.to_json
end

#update an existing post, given its id and new information
patch '/posts/:id' do

	post = Post.get(params["id"])
	if !p.nil?
	uTitle = params["title"]
	uBody = params["body"]
	post.title = uTitle
	post.body = uBody
	post.save
	halt 200, post.to_json

else
	halt 404, {"message" => "Post not found."}.to_json
end
end

#delete a posts, given its id
delete '/posts/:id' do
	p = Post.get(params["id"])
	if !p.nil?
	p.destroy
	halt 200, {"message" =>"Post removed."}.to_json
else
	halt 404, {"message" => "Post not found."}.to_json
end
end

delete '/posts' do
	p = Post.get(params["id"])
	if !p.nil?
	p.destroy
	halt 200, {"message" =>"Post removed."}.to_json
else
	halt 404, {"message" => "Post not found."}.to_json
end
end