#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'



configure do


	
	$db = SQLite3::Database.new 'barber.db'
	$db.execute 'CREATE TABLE IF NOT EXISTS
		Users
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT,
			"username" TEXT,
			"phone" TEXT,
			"datestamp" TEXT,
			"barber" TEXT,
			"color" TEXT)'

end

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

	
	$db.execute 'insert into
		Users
		(
			username,
			phone,
			datestamp,
			color,
			barber
			)
		values(?, ?, ?, ?, ?)', [@name, @phone, @date, @color, @barber]

	erb "Ok, we write your name and date, #{@name} we wait for you..."
end

get '/contacts' do
	erb :contacts
end

get '/showusers' do
	erb :showusers
end


