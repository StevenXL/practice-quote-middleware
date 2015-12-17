class QuoteMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    return [200, {'Content-Type' => 'text/plain'},[quote]] if env['PATH_INFO'] == "/quote"

    @app.call(env)
  end

  private

  def quote
    quotes.sample
  end

  def quotes
    @quotes ||= IO.readlines('fixtures/rickygervais.txt')
  end
end
