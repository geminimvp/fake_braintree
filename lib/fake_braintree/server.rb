require 'forwardable'
require 'capybara'
require 'fake_braintree/sinatra_app'

class FakeBraintree::Server
  SERVER_HOST = '127.0.0.1'

  extend Forwardable
  def_delegators :@server, :port, :boot

  def initialize(options = {})
    app = FakeBraintree::SinatraApp
    server_options = {
      port: options.fetch(:port, nil),
      host: SERVER_HOST,
    }
    @server = Capybara::Server.new(app, server_options)
  end
end
