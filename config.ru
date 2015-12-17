require 'httparty'
require 'json'
require 'rack'

require_relative "lib/quote_middleware"

ROOT = Dir.getwd

use QuoteMiddleware

app = lambda do |env|
  [200, {'Content-Type' => 'text/plain'}, ['Underlying App Called']]
end

run app
