require 'rack'
require_relative 'quote_machine'
require_relative 'quote_middleware'

use QuoteMiddleware
run QuoteMachine.new
