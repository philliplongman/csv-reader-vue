ENV["RACK_ENV"] = "test"

require "./config/environment"
require "./spec/support/features_helper"

require "capybara/rspec"
require "capybara/poltergeist"

require File.expand_path "../../app.rb", __FILE__

module RSpecMixin
  include Rack::Test::Methods
  include Capybara::DSL

  def app() Sinatra::Application end
end

RSpec.configure do |c|
  c.include RSpecMixin
  c.include FeaturesHelper, type: :feature
end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, phantomjs_logger: Tempfile.new("shutup"))
end

Capybara.configure do |config|
  config.default_driver = :poltergeist
  config.app = Sinatra::Application
end
