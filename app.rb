require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'pg'

conn = nil
data_path_regex = %r{(\/index|\/videos)} 

before data_path_regex do
	conn = PGconn.open(ENV["DB_HOST"], ENV["DB_PORT"], '', '', ENV["DB_NAME"])
end

get '/index' do
	res = conn.exec('SELECT title, description, slug FROM video WHERE active = TRUE ORDER BY "postedDate" DESC LIMIT(3)')
	
	erb :"2012/index", :locals => { :videos => res }
end

get '/2011' do
	erb :"2011/index"
end

get '/signup' do
	erb :"2012/signup"
end

post '/signup' do

end

get '/videos' do
	res = conn.exec('SELECT * FROM video WHERE active = TRUE ORDER BY "postedDate" DESC')

	erb :"2012/videos", :locals => { :videos => res }
end

get '/videos/:slug' do |s|
	res = conn.exec('SELECT * FROM video WHERE slug = $1', [s])

	erb :"2012/video", :locals => { :video => res[0] }
end

get '/' do 
	redirect '/index'
end

after data_path_regex do
	if not conn.nil? then conn.close() end
end