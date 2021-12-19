# frozen_string_literal: true

require 'spec_helper'
RSpec.describe 'Testing Login page', type: :feature do
  before do
    @home_page = HomePage.new
    @contactus_page = ContactUsPage.new
    @contactus_page.load
  end

  it 'Check write email' do
    @contactus_page.inputFullName('Name SecondName')
    @contactus_page.inputEmail(Constants::EMAIL)
    @contactus_page.inputText('Thank you for creating this website to make me do some auto-tests')
    @contactus_page.submitMessageClick

    expect(@contactus_page.successfullySent).to eq('Your enquiry has been successfully sent to the store owner.')
  end
end