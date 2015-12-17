class QuoteMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'][/^\/quote/]
      [200, {'Content-Type' => 'text/plain'}, [quote]]
    else
      @app.call(env)
    end
  end

  private

  def quote
    quotes.sample
  end

  def quotes
    internal_quotes.concat(api_quote)
  end

  def internal_quotes
    if @quotes
      @quotes
    elsif Dir.exists?('fixtures')
      load_quotes
    else
      []
    end
  end

  def load_quotes
    text_files.each_with_object([]) do |file, quotations|
      quotations.concat(parse(file))
    end
  end

  def parse(file)
    file = "fixtures/#{file}"
    IO.readlines(file)
  end

  def text_files
    Dir.entries("fixtures").select do |entry|
      entry[/\.txt\z/] and !Dir.exists?(entry)
    end
  end

  def api_quote
    response = HTTParty.get("http://quotes.stormconsultancy.co.uk/random.json")
    [JSON.parse(response.body)['quote']]
  end
end
