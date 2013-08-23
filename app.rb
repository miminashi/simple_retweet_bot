# coding: utf-8

require 'rubygems'
require 'bundler/setup'

require 'tweetstream'
require 'twitter'

HASHTAG = '#艦これ'

CONSUMER_KEY = 'your consumer key'
CONSUMER_SECRET = 'your consumer secret'
OAUTH_TOKEN = 'your oauth token'
OAUTH_TOKEN_SECRET = 'your oauth token secret'

Twitter.configure do |config|
  config.consumer_key = CONSUMER_KEY
  config.consumer_secret = CONSUMER_SECRET
  config.oauth_token = OAUTH_TOKEN
  config.oauth_token_secret = OAUTH_TOKEN_SECRET
end

TweetStream.configure do |config|
  config.consumer_key       = CONSUMER_KEY
  config.consumer_secret    = CONSUMER_SECRET 
  config.oauth_token        = OAUTH_TOKEN
  config.oauth_token_secret = OAUTH_TOKEN_SECRET
  config.auth_method        = :oauth
end

TweetStream::Client.new.track(HASHTAG) do |status|
  puts "#{status.text}"
  Twitter.retweet(status.id)
end

