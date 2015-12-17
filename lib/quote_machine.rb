class QuoteMachine
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, ['The root application was called']]
  end
end
