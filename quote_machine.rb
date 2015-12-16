require 'rack'

class QuoteMachine
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, ['Hello World']]
  end
end

app = QuoteMachine.new

Rack::Handler::WEBrick.run app
