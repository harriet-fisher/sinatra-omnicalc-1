require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square_root/new") do
  erb(:square_root)
end

post("/square_root/results") do
  @number = params.fetch("number").to_f
  @square_root = (@number)**0.5
  erb(:square_root_results)
end

post("/square/results") do
  @number = params.fetch("number").to_f
  @square = @number**2
  erb(:square_results)
end

get("/payment/new") do
  erb(:payment)
end

post("/payment/results") do
  @apr = (params.fetch("user_apr").to_f)/100
  @years = params.fetch("user_years").to_i
  @pv = params.fetch("user_pv").to_f
  payment_numerator = (@apr/12)*@pv
  payment_denominator = 1 - (1 + (@apr/12))**(-(@years*12))
  @user_payment = (payment_numerator/payment_denominator).round(2)
  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

post("/random/results") do
  min = params.fetch("minimum").to_f
  max = params.fetch("maximum").to_f
  @user_rand = rand(min..max)
  erb(:random_res)
end
