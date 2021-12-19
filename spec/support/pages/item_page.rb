# frozen_string_literal: true

require 'site_prism'

class ItemPage < SitePrism::Page
  element :add_to_cart_button, 'input[class="button-1 add-to-cart-button"]'
  element :add_to_compare_list_button, 'input[value="Add to compare list"]'
  element :recipient_input, '.recipient-name' #Element for gift cards only
  element :text_area_gift_card, '.message' #Element for gift cards only 
  element :computer_price, '.price-value-75' #For /simple-computer only

  def addToCartItem; add_to_cart_button.click end
  def addToCompareList; add_to_compare_list_button.click end
  def inputRecipientName(name) recipient_input.set name.to_s end
  def sendMessageOnGiftCard(message) text_area_gift_card.set message.to_s end
  def getComputerPrice; computer_price.text end
end