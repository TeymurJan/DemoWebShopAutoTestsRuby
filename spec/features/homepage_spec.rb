# frozen_string_literal: true

require 'spec_helper'
RSpec.describe 'Testing Home page', type: :feature do
  before do
    @home_page = HomePage.new
    @home_page.load
  end

  it 'Check home page link' do
    expect(@home_page.current_path).to eq('/')
  end
end
