# frozen_string_literal: true

require 'site_prism'

class Desktops < SitePrism::Page
  set_url '/desktops'
  element :add_to_cart_button, 'input[value="Add to cart"]', match: :first
  element :sort_by_dropdown, '#products-orderby'

  def addToCartList; add_to_cart_button.click end
  def selectSorter(sort) sort_by_dropdown.select(sort.to_s) end
end