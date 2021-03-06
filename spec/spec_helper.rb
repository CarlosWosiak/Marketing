require 'rubygems'
require 'bundler'
Bundler.setup

require 'rspec'
require 'capybara/rspec'

require 'dotenv'
Dotenv.load

require 'middleman-core/load_paths'
::Middleman.setup_load_paths

require 'middleman-core'
require 'middleman-core/rack'

@middleman_app = ::Middleman::Application.new

Capybara.app = ::Middleman::Rack.new(@middleman_app).to_app do
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
  set :environment, :development
  set :show_exceptions, false
end
