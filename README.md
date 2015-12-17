Authors' Notes
=========================

### Dependency's

This Rack middleware application depends on the following:

* the 'httparty' gem

While not strictly required, the middleware will not read local files from
quotes unless:
* The quotes are contained in text files within the `fixtures` directory. This
  directory must live in the Application's root.
* In the `*.txt` files themselves, the quotes need to be delimited by a newline.
* The `quote_middleware.rb` file itself lives in the `lib` directory, which in
  turn lives in the Application's root.

### Trade-offs
In the current implementation of the middleware, all the quotes are loaded into
a single array, and then a quote is picked at random from that array. This is
very memory intensive, but it is speedy because:
1. All the data is loaded into memory
2. The local / internal quotes are memoized to avoid having to read from disk.

However, if memory was at a premium another possibility is to trade a slower
application for a more memory efficient one. This could be done as follows:

* First, load the text file *names* (not their actual data), into an array. From
  that array, pick a name at random.
* Read only that file's contents, load them into memory, and pick a quote from
  those contents at random.

Note that, while this is more memory efficient since only one file's contents
are loaded into memory, it is slower. We have to read from disk every time. (If
we memoized the contents of a single file, then all other quotes would be
discarded).

Practice: Rack Middleware
=========================

A practice designed to learn more about Rack middleware and
[Ricky Gervais Quotes](http://www.rickygervaisquotes.com/).


### Goal

Rack is a minimal and modular interface for developing web applicatons.
Rack middleware is a extension that sits between an HTTP request and an
application, thus the middleware term. You goal is to create a Rack
middleware that serves random quotes. The middleware, when complete, can
be inserted into an existing application to provide a fun set of quotes.
A sample fixture has been added for quotes by
[Ricky Gervais](http://www.rickygervaisquotes.com/).


### Expectations

* Use Bundler for gem dependencies
* Adhere to the standards of Rack and middleware
* Code is tested with RSpec
* Quotes come from examples in fixtures directory
* Share project on github and commit regularly - do not commit all changes at once
* Prepare to discuss decisions/trade-offs
* Spend no more than 2 days on the challenge


### Request/Response

    Request: /quote

    Response Body: -example quote-

    Format: text/plain


### Testing

As mentioned, write all tests with the Rspec framework. A testing harness
should execute using the following command.

    $ rspec spec

_Do not test with an HTTP web interface, only test the library methods
and how they would respond if embedded in a web application._


### Links / Dependencies

These links are provided as a helper to find information. These are not the
only sources, so look for more if they do not give a full explanation.

[Bundler](http://bundler.io/)

[Rack](http://rack.github.io/)

[RSpec](http://rspec.info/)


### Extra credit ideas

* Setup continuous integration with Magnum CI, Travis CI, or Semaphore
* Integrate quotes via an online API
