ENV['RACK_ENV'] = 'test'

require "./config/environment"
require 'capybara/rspec'
require 'capybara/poltergeist'

require File.expand_path '../../app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  include Capybara::DSL

  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }

Capybara.configure do |config|
  config.default_driver = :poltergeist
  config.app = Sinatra::Application
end
