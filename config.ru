ROOT = Dir.getwd

require 'rack'
require "#{ROOT}/lib/quote_middleware"

use QuoteMiddleware

app = lambda do |env|
  [200, {'Content-Type' => 'text/plain'}, ['Underlying App Called']]
end

run app
