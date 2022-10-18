#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@name = params[:username]
	@phone = params[:phone]
	@date = params[:date]
	@barber = params[:barber]
	@color = params[:color]

	hh = {
		:username => 'name is empty',
		:phone => 'phone is empty',
		:date => 'date is empty'
	}

	hh.each do |key, value|
		if params[key] == ''
			@error = hh[key]
			return erb :visit
		end
	end


	f = File.open("./public/users.txt", "a")
	f.write("name: #{@name}| phone: #{@phone}| date: #{@datetime}| name of barber: #{@barber} color:#{@color}")
	f.close

	erb "Ok, we write your name and date, #{@name} we wait for you..."
end

get '/contacts' do
	erb :contacts
end

