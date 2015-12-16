class QuoteMachine
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, [quote]]
  end

  private

  def quote
    quotes.sample
  end

  def quotes
    IO.readlines('./fixtures/rickygervais.txt')
  end
end
