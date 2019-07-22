require File.expand_path '../spec_helper.rb', __FILE__

def assert_response(sym)
    case sym
    when :success
        expect(last_response.status).to eq(200)
    when 200
        expect(last_response.status).to eq(200)
    when 404
        expect(last_response.status).to eq(404)
    when 401
        expect(last_response.status).to eq(401)
    when 422
        expect(last_response.status).to eq(422)
    when 201
        expect(last_response.status).to eq(201)
    end
end

def contains_post_attributes(hash)
	expect(hash.key? "id").to eq(true)
	expect(hash.key? "title").to eq(true)
	expect(hash.key? "body").to eq(true)
	expect(hash.key? "created_at").to eq(true)
end

def json_hash_matches_object?(hash, post_obj)
	contains_post_attributes(hash)
	expect(hash["id"]).to eq(post_obj.id)
	expect(hash["title"]).to eq(post_obj.title)
	expect(hash["body"]).to eq(post_obj.body)
end

describe "My application" do
    before(:all) do
        @post = Post.new(title: "MyTitle", body: "MyContent")
        @post.save
    end

    it "should get index" do
        get "/posts"
        assert_response :success
    end

    it "should create post" do
        expect{
            post "/posts", params: { post: { body: @post.body, title: @post.title } }
        }.to change{Post.all.count}.by(1)

        assert_response 201   
    end

    it "should show post" do
        get "/posts/#{@post.id}"
        assert_response :success

        post_json = last_response.body
		post_hash = JSON.parse(post_json)	
		json_hash_matches_object?(post_hash, @post)
    end

    it "should update post" do
        patch "/posts/#{@post.id}", params: { post: { body: @post.body, title: @post.title } }
        assert_response 200
    end

    it "should destroy post" do
        expect{
            delete "/posts/#{@post.id}"
        }.to change{Post.all.count}.by(-1)

        assert_response 204
    end
end