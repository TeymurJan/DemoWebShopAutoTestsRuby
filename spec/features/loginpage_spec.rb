# frozen_string_literal: true

require 'spec_helper'
RSpec.describe 'Testing Login page', type: :feature do
  before do
    @login_page = LoginPage.new
    @home_page = HomePage.new
    @login_page.load
  end

  it 'Check successful authorization' do
    @login_page.emailInput(Constants::EMAIL.to_s)
    @login_page.passwordInput(Constants::PASSWORD)
    @login_page.rememberMeClick
    @login_page.loginClick

    expect(@home_page.getMyAccountEmail).to eq(Constants::EMAIL.to_s)
  end
end