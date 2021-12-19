# frozen_string_literal: true

require 'spec_helper'
RSpec.describe 'Testing Registration page', type: :feature do
  before do
    @register_page = RegisterPage.new
    @register_confirmation_page = RegisterConfirmationPage.new
    @register_page.load
  end

  it 'Check successfull registration' do
    @register_page.registration
    @register_page.registerInputClick

    expect(@register_confirmation_page.current_path).to eq('/registerresult/1')
    expect(@register_confirmation_page.successfullyRegistrated).to eq('Your registration completed')
  end

  it 'Check registration with same email' do
    @register_page.registration(Constants::EMAIL.to_s)
    @register_page.registerInputClick

    expect(@register_page.emailAlreadyExistsMessage).to eq('The specified email already exists')
  end

  it 'Check registration with invalid confirm password' do
    @register_page.registration
    @register_page.inputConfirmPassword('123')
    @register_page.registerInputClick

    expect(@register_page.invalidConfirmPasswordMessage).to eq('The password and confirmation password do not match.')
  end
end
