class Product
  attr_reader :customer_review_average,
              :sku,
              :name,
              :short_description,
              :image,
              :sale_price

  def initialize(result)
    @customer_review_average = result[:customerReviewAverage] || "no content"
    @sku = result[:sku] || "no content"
    @name = result[:name] || "no content"
    @short_description = result[:shortDescription] || "no content"
    @image = result[:image] || "no content"
    @sale_price = result[:salePrice] || "no content"
  end
end
