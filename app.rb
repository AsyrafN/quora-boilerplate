require_relative './config/init.rb'
require 'date'
set :run, true

get '/' do
  @name = "Bob Smith"
  erb :"home"

  @date = DateTime.now
  @date.strftime "%d/%m/%Y %H:%M"
  erb :"home"
end