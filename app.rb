require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'pg'
require 'uri'
require 'builder'

data_path_regex = %r{(\/index|\/videos)} 

configure do
  mime_type :woff, 'application/x-font-woff'
  mime_type :ttf, 'font/ttf'
  mime_type :eot, 'font/eot'
  mime_type :otf, 'font/otf'
end

before data_path_regex do

	uri = URI.parse(ENV["DATABASE_URL"])
	database = (uri.path || "").split("/")[1]
	
	@conn = PGconn.connect(:dbname => database, :port => uri.port, 
						  :host => uri.host, :user => uri.user, 
						  :password => uri.password)
end

before '/videos/rss.xml' do
	cache_control :public, :must_revalidate, :max_age => 60
end

get '/index' do
	res = @conn.exec('SELECT title, description, slug FROM video WHERE active = TRUE ORDER BY "postedDate" DESC LIMIT(3)')
	
	erb :"2012/index", :locals => { :videos => res }
end

get '/2011' do
	erb :"2011/index", :layout => :"2011_layout"
end

get '/videos/rss.xml' do
	content_type 'application/rss+xml'

	res = @conn.exec('SELECT * FROM video WHERE active = TRUE ORDER BY "postedDate" DESC')

	builder do |xml|
		xml.instruct! :xml, :version => '1.0'
		xml.rss :version => "2.0" do
			xml.channel do 
				xml.title "HTML5.tx Videos"
				xml.description "Videos from the HTML5.tx 2011 Event"
				xml.link "http://html5tx.com"

				res.each do |video|
					xml.item do
						xml.title video["title"]
						xml.link "http://html5tx.com/videos/#{video['slug']}"
						xml.description video["description"]
						xml.pubDate video["postedDate"]
						xml.guid "http://html5tx.com/videos/#{video['slug']}"
					end
				end 
			end
		end
	end
end

get '/videos' do
	res = @conn.exec('SELECT * FROM video WHERE active = TRUE ORDER BY "postedDate" DESC')

	erb :"2012/videos", :locals => { :videos => res }
end

get '/videos/:slug' do |s|
	res = @conn.exec('SELECT * FROM video WHERE slug = $1', [s])

	erb :"2012/video", :locals => { :video => res[0] }
end

get '/' do 
	redirect '/index'
end

after data_path_regex do
	if not @conn.nil? then @conn.close() end
end