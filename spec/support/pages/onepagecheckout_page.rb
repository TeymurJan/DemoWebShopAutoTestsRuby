#frozen_string_literal: true

require 'site_prism'

class OnePageCheckout < SitePrism::Page
  set_url '/onepagecheckout'
  element :city_input, '#BillingNewAddress_City'
  element :billing_address_1_input, '#BillingNewAddress_Address1'
  element :zip_postal_code_input, '#BillingNewAddress_ZipPostalCode'
  element :phone_number_input, '#BillingNewAddress_PhoneNumber'
  element :credit_card_radio_button, '#paymentmethod_2'
  element :card_holder_name_input, 'input[name="CardholderName"]'
  element :card_number_input, 'input[name="CardNumber"]'
  element :card_code_input, 'input[name="CardCode"]'
  element :confirm_order_button, 'input[value="Confirm"]'
  element :select_country, '#BillingNewAddress_CountryId'
  element :next_day_air_radio_button, '#shippingoption_1'
  element :successful_order_title, :xpath, "//div[@class='title']//strong"

  elements :continue_buttons, 'input[value="Continue"]'

  def inputCityName(city) city_input.set city.to_s end
  def inputBillingAddress(address) billing_address_1_input.set address.to_s end
  def inputZipPostalCode(zip) zip_postal_code_input.set zip.to_s end
  def inputPhoneNumber(number) phone_number_input.set number.to_s end
  def checkoutCreditCardPayment; credit_card_radio_button.click end
  def inputCardHolderName(name) card_holder_name_input.set name.to_s end
  def inputCardNumber(cnumber) card_number_input.set cnumber.to_s end
  def inputCardCode(code) card_code_input.set code.to_s end
  def clickConfirmButton; confirm_order_button.click end
  def selectCountry(country) select_country.select(country.to_s) end
  def nextDayAirShippingMethod; next_day_air_radio_button.click end
  def getSuccessfulOrderMessage; successful_order_title.text end

  def continueButton
    continue_buttons.each do |btn|
      return yield btn.click
    end
  end
end