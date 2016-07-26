require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative "config/application.rb"

set :views, proc { File.join(root, "app/views") }
set :bind, '0.0.0.0'



get '/' do
  # TODO
  # 1. fetch posts from database.
  # 2. Store these posts in an instance variable
  # 3. Use it in the `app/views/posts.erb` view
  @posts = Post.sorted_by_votes

  erb :posts # Do not remove this line
end

# TODO: add more routes to your app!

# edit
get '/posts/new' do
  @post = Post.new
  erb :new
end

# create
post '/posts' do
  @post = Post.new(params)
  if @post.save
    redirect "/"
  else
    @errors = @post.errors.full_messages
    erb :new
  end
end