require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'pg'
require 'uri'

conn = nil
data_path_regex = %r{(\/index|\/videos)} 

before data_path_regex do
	uri = URI.parse(ENV["DATABASE_URL"])
	database = (uri.path || "").split("/")[1]
	adapter = "postgresql" if adapter == "postgres"
	
	conn = PGconn.connect(:dbname => database, :port => uri.port, 
						  :host => uri.host, :user => uri.user, 
						  :password => uri.password)
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