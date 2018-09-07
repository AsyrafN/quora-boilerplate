require_relative './config/init.rb'

set :run, true

get '/' do
   erb :"home"
end

get '/signup' do
	erb :"signup"
end

# get '/users/profile' do
#   erb :"/users/profile"
# end

get '/users/:id' do
  @user = User.find_by(id: params[:id])

  if @user
  	erb :"users/profile"
  else
  	redirect '/404'
  end
end

get '/404' do
	return "something went wrong"
end

# (email: params[:email], password: params[:password])
post '/signup' do
 	@user = User.new
 	@user.first_name = params[:user][:first_name]
 	@user.last_name = params[:user][:last_name]
 	@user.email = params[:user][:email]
	@user.password = params[:user][:password]
 	if @user.save
 		redirect '/users/profile'
 	else
    	puts "please input valid data"
  end
  
end  

# params = {email: "email", password: "password"}


post '/login' do
  user = User.find_by_email(params[:user][:email])
  # p user
  # p params
  if user && user.authenticate(params[:user][:password]) 
  	sign_in(user)
  	redirect "/users/#{user.id}"
  else
    puts "failed"
  end
end

post '/logout' do
  sign_out
  redirect '/'
end


