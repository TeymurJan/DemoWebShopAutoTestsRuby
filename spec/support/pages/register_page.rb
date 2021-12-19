# frozen_string_literal: true

require 'site_prism'

class RegisterPage < SitePrism::Page
  set_url '/register'
  element :gender_male_radiobtn, '#gender-male'
  element :gender_female_radiobtn, '#gender-female'
  element :first_name_input, 'input[name="FirstName"]'
  element :last_name_input, 'input[name="LastName"]'
  element :email_input, 'input[name="Email"]'
  element :password_input, 'input[name="Password"]'
  element :confirm_password_input, 'input[name="ConfirmPassword"]'
  element :register_input, '.register-next-step-button'

  element :email_already_exists_message, '.validation-summary-errors'
  element :wrong_confirm_password, 'span[for="ConfirmPassword"]'

  #If method's parameter true -> click first statement, else -> click second
  def selectGender(is_male) is_male ? gender_male_radiobtn.click : gender_female_radiobtn.click end
  def inputFirstName(name) first_name_input.set name.to_s end
  def inputLastName(sname) last_name_input.set sname.to_s end
  def inputEmail(email) email_input.set email.to_s end
  def inputPassword(pass) password_input.set pass.to_s end
  def inputConfirmPassword(cpass) confirm_password_input.set cpass.to_s end
  def registerInputClick; register_input.click end

  def emailAlreadyExistsMessage; email_already_exists_message.text end
  def invalidConfirmPasswordMessage; wrong_confirm_password.text end

  def registration(email = nil, is_male = true, password = 'qwerty123')
    self.load
    register_page = RegisterPage.new
    email = "#{Randomizer.getCurrentDate.to_s}@mail.ru" if email.nil?
    register_page.selectGender(is_male)
    register_page.inputFirstName('Name')
    register_page.inputLastName('SecondName')
    register_page.inputEmail(email)
    register_page.inputPassword(password)
    register_page.inputConfirmPassword(password)
  end
end
