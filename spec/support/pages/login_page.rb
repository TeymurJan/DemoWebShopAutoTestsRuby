#frozen_string_literal: true

require 'site_prism'

class LoginPage < SitePrism::Page
  set_url '/login'
  element :email_input, '.email'
  element :password_input, '.password'
  element :remember_me_checkbox_input, 'input[name="RememberMe"]'
  element :login_button, '.login-button'

  def emailInput(email) email_input.set email.to_s end
  def passwordInput(pass) password_input.set pass.to_s end
  def rememberMeClick; remember_me_checkbox_input.click end
  def loginClick; login_button.click end

  def authorization
    self.load
    emailInput(Constants::EMAIL.to_s)
    passwordInput(Constants::PASSWORD)
    rememberMeClick
    loginClick
  end
end