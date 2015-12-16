class QuoteMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == "/quote"
      @app.call(env)
    else
      [200, {'Content-Type' => 'text/plain'},['hello']]
    end
  end
end
