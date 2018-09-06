require_relative './config/init.rb'

set :run, true

get '/' do
  # @name = "Bob Smith"
  erb :"home"
end
# (email: params[:email], password: params[:password])
post '/signup' do
 	@user = User.new
 	@user.email = params[:user][:email]
	@user.password = params[:user][:password]
 	if @user.save
 		erb :"signup"
 	else
    	puts "please input valid data"
  end
  
end  

# params = {email: "email", password: "password"}
