require_relative '../lib/quote_middleware'
require_relative 'stubs/quotes'

RSpec.describe QuoteMiddleware do
  let(:app) do
    # simple object that responds to #call
    -> env { [200, {'Content-Text' => 'text/plain'}, ['Underlying App Executed']] }
  end

  let(:middleware)     { QuoteMiddleware.new(app) }
  let(:request)        { Rack::MockRequest.new(middleware) }
  let(:stubbed_quotes) { Quotes.quotes }

  before(:each) do
    # must use allow_any_instance_of because quotes is a private method
    allow_any_instance_of(QuoteMiddleware).to receive(:quotes).and_return(stubbed_quotes)
  end

  it "passes a test" do
    expect("true").to eq("true")
  end
end
