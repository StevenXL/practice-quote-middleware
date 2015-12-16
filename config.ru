require 'rack'
require_relative 'lib/quote_machine'
require_relative 'lib/quote_middleware'

use QuoteMiddleware
run QuoteMachine.new
