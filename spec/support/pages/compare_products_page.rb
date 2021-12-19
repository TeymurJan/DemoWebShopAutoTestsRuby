# frozen_string_literal: true

require 'site_prism'

class CompareProductsPage < SitePrism::Page
  set_url '/compareproducts'
  element :product_price, :xpath, "//tr[@class='product-price']//td[@class='a-center']"

  def getProductPrice; product_price.text end
end