# require 'bundler'
# Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base
  	get '/' do
    erb :index, locals: {gossips: Gossip.all}
	end
	  get '/gossips/new/' do
	  erb :new_gossip
	end
	get '/gossips/:id/' do |n| 
  	  Gossip.new("", "").find(n)
  	  erb :gossip_show, locals: {find_gossips: Gossip.new("", "").find(n)}
	end
	post '/gossips/new/' do
	Gossip.new(params["gossip_author"], params["gossip_content"]).save
	redirect '/'
	end	
  # run! if app_file == $0
end