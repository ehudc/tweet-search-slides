require 'twitter'
require 'sinatra'
require 'slim'

Slim::Engine.set_default_options pretty: true, sort_attrs: false

Twitter.configure do |config|
	config.consumer_key = ENV['CON_KEY']
  	config.consumer_secret = ENV['CON_SEC']
  	config.oauth_token = ENV['OAUTH_T']
  	config.oauth_token_secret = ENV['OAUTH_TS']
end

get '/' do
  slim :index
end

# for user search
post '/' do
  $hashtag =  params[:hashtag]
  $tweets = Twitter.search('#'+$hashtag, count: 50).results
  slim :hashtag #, :locals => {:tag => $hashtag}
end
