# spec/spec_helper.rb
require 'rack/test'
require 'rspec'
ENV['RACK_ENV'] = 'test'

require File.expand_path '../../web.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods

  def app() Sinatra::Application end
end



# For RSpec 2.x and 3.x
RSpec.configure do |c|
	c.include RSpecMixin 
	DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/dog_test.db")
  	DataMapper.finalize
  	Dog.auto_migrate!
end
