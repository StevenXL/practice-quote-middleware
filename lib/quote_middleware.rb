class QuoteMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    return [200, {'Content-Type' => 'text/plain'}, [quote]] if env['PATH_INFO'][/^\/quote/]

    @app.call(env)
  end

  private

  def quote
    quotes.sample
  end

  def quotes
    @quotes ||= load_quotes
  end

  def load_quotes
    text_files.each_with_object([]) do |file, quotations|
      quotations.concat(parse(file))
    end
  end

  def parse(file)
    file = "#{Dir.getwd}/fixtures/#{file}"
    IO.readlines(file)
  end

  def text_files
    Dir.entries("fixtures").select do |entry|
      entry[/\.txt\z/] and !Dir.exists?(entry)
    end
  end
end
