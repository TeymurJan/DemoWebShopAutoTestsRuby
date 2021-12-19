# frozen_string_literal: true

require 'site_prism'

class RegisterConfirmationPage < SitePrism::Page
  element :succesfully_registrated_div, '.result'

  def successfullyRegistrated; succesfully_registrated_div.text end
end
