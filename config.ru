require 'rack'
require_relative 'lib/rack_app'

use Rack::Runtime
run RackApp.new
