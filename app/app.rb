require 'rubygems'
require 'bundler/setup'
require 'sinatra'

get '/' do 
	redirect '/index'
end

get '/index' do
	erb :"2012/index"
end

get '/2011' do
	erb :"2011/index"
end

get '/*' do
	erb :"404"
end