class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new( url: "https://api.bestbuy.com/v1/products") do |conn|
      conn.request  :url_encoded
      conn.response :logger
      conn.adapter  Faraday.default_adapter
      conn.headers['Content-Type'] = 'application/json'
      conn.params['format'] = 'json'
      conn.params['apiKey'] = ENV['BEST_BUY_API_KEY']
    end
  end

  def method_name

  end

end
