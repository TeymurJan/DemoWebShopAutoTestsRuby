# frozen_string_literal: true

require 'site_prism'

class ShoppingCart < SitePrism::Page
  set_url '/cart'
  element :empty_shopping_cart, :xpath, "//div[@class='order-summary-content']"
  element :terms_of_service_checkbox, '#termsofservice'
  element :checkout_button, '.checkout-button'

  def emptyShoppingCart; empty_shopping_cart.text end
  def termsOfServiceClick; terms_of_service_checkbox.click end
  def checkOutClick; checkout_button.click end
end