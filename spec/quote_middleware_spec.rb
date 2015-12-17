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

  context "when URI does not start with '/quote'" do
    it "should execute the underlying application" do
      response = request.get "/"
      expect(response.body).to eq('Underlying App Executed')
    end

    it "should return a 200 status code" do
      response = request.get "/"
      expect(response.status).to eq(200)
    end
  end
end
