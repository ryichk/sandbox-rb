require 'rack'
require_relative 'lib/rack_app'
require_relative 'lib/simple_rack_middleware'

use Rack::Runtime
use SimpleRackMiddleware
run RackApp.new
