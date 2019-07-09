require "sinatra"
require "sinatra/activerecord"
enable "sessions"

class User < ActiveRecord::Base
end

#LOCAL
#ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "./db.sqlite3")
#HEROKU
require "active_record"
ActiveRecord::Base.establish_connection(ENV["postgres://wlremhojbkyxcg:1260e13cbf10b63e76b11b4eb80d7f455f2aa6696a08b90aaad8f777e77467b9@ec2-50-19-222-129.compute-1.amazonaws.com:5432/d8j4ecgvedle9s"])


get "/" do
  erb :home
end

get "/login" do
  erb :login
end

post "/login" do
  username = params[:username]
  given_password = params[:password]
  user = User.find_by(username: username)

  p username
  p given_password
end

get "/signup" do
  erb :signup
end

post "/signup" do
  user = User.new(username: params[:username], password: params[:password])
  user.save
  redirect "/"
end

post "/logout" do

end
