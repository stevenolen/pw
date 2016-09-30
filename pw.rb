require 'sinatra'

set :server, :puma
set :environment, :production

list = File.readlines('wordlist.txt').map(&:chomp)
get '/password' do
  [list.sample, list.sample, list.sample, rand(99)].shuffle.join('')
end

get '/' do
  File.new('public/index.html').readlines
end
