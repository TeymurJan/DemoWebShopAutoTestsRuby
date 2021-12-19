# frozen_string_literal: true

require 'site_prism'

class HomePage < SitePrism::Page
  set_url '/'

  element :my_account, :xpath, "//div[@class='header-links']//a[@class='account']" #Only for logged in account
  element :register_button, '.ico-register'
  element :login_button, '.ico-login'
  element :shopping_cart_count, '.cart-qty'

  elements :categores_list_pages, :xpath, "//li[@class='inactive']//a"
  elements :column_information, '.information'

  def getMyAccountEmail; my_account.text end
  def registerBtnClick; register_button.click end
  def loginBtnClick; login_button.click end
  def goToShoppingCart; shopping_cart_count.click end
  def goToColumnInformation(info) column_information.each { |el| el.click if el.text == info } end
  def selectPage(page) 
    categores_list_pages.each do |el| 
      if el.text == page
        el.click
        break
      end
    end
  end
end
