require_relative './config/init.rb'

set :run, true

get '/' do
   erb :"home"
end

get '/signup' do
	erb :"signup"
end

get '/profile' do
  erb :"profile"
end
# (email: params[:email], password: params[:password])
post '/signup' do
 	@user = User.new
 	@user.first_name = params[:user][:first_name]
 	@user.last_name = params[:user][:last_name]
 	@user.email = params[:user][:email]
	@user.password = params[:user][:password]
 	if @user.save
 		redirect '/profile'
 	else
    	puts "please input valid data"
  end
  
end  

# params = {email: "email", password: "password"}


post '/login' do
  user = User.find_by_email(params[:user][:email])
  if user.authenticate(params[:user][:password]) 
  	session[:user_id] = user.id
  	redirect '/profile'
  else
    puts "failed"
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end