require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/square/new") do
  erb(:home)
end

get("/square_root/new") do
  erb(:home)
end

post("/square_root/results") do
  @number = params.fetch("number").to_i
  @square_root = @number**0.5
  erb(:flexible)
end

post("/square/results") do
  @number = params.fetch("number").to_i
  @square = @number**2
  erb(:flexible)
end
