# frozen_string_literal: true

require 'spec_helper'
RSpec.describe 'Testing One Page Checkout', type: :feature do
  before do
    @home_page = HomePage.new
    @item_page = ItemPage.new
    @register_page = RegisterPage.new
    @shopping_cart_page = ShoppingCart.new
    @one_page_checkout = OnePageCheckout.new
    @item_categories_page = ItemCategories.new
  end

  it 'Check successful order' do
    @register_page.registration
    @register_page.registerInputClick
    visit '/'

    #Add $100 gift card to cart
    @home_page.selectPage('Gift Cards')
    @item_categories_page.goTo100DollarGiftCard
    @item_page.inputRecipientName('Name')
    @item_page.sendMessageOnGiftCard('Hope you got my giftcard')
    @item_page.addToCartItem

    #Add 'Computing and Internet' book to cart 
    @home_page.selectPage('Books')
    @item_categories_page.goToBookComputingAndInternet
    @item_page.addToCartItem

    #Add 'Denim shorts' element to cart
    # @home_page.selectPage('Apparel & Shoes')
    # @item_categories_page.goToDenimShort
    # @item_page.addToCartItem
    #Website changed status of this category to 'Out of stock'

    #Start ordering
    @home_page.goToShoppingCart
    @shopping_cart_page.termsOfServiceClick
    @shopping_cart_page.checkOutClick

    #Filling billidng address
    @one_page_checkout.selectCountry('Azerbaijan')
    @one_page_checkout.inputCityName('Baku')
    @one_page_checkout.inputBillingAddress('Billing Address')
    @one_page_checkout.inputPhoneNumber('+994501234567')
    @one_page_checkout.inputZipPostalCode('AZ1234')
    @one_page_checkout.continueButton { |el| el.click }

    #Skip shipping address
    @one_page_checkout.continueButton { |el| el.click }

    #Select shipping method
    @one_page_checkout.nextDayAirShippingMethod
    @one_page_checkout.continueButton { |el| el.click }

    #Select payment method
    @one_page_checkout.checkoutCreditCardPayment
    @one_page_checkout.continueButton { |el| el.click }

    expect(@one_page_checkout.getSuccessfulOrderMessage).to eq('Your order has been successfully processed!')
  end
end