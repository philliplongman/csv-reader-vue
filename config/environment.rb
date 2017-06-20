require "rubygems"
require "bundler"

Bundler.require(:default)
Bundler.require(:default, Sinatra::Base.environment)

configure do
  set :server, :puma
end

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

set :root, File.dirname(".")
