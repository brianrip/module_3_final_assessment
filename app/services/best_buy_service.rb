class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new( url: "https://api.bestbuy.com/v1/") do |conn|
      conn.request  :url_encoded
      conn.response :logger
      conn.adapter  Faraday.default_adapter
      conn.params['format'] = 'json'
      conn.params['apiKey'] = ENV['BEST_BUY_API_KEY']
    end
  end

  def products(keyword)
    search_chars = keyword.gsub(" ", "&")
    results = parse(connection.get("products(search=#{search_chars})", pageSize: 15))
    results[:products].map do |result|
      Product.new(result)
    end
 end

private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
