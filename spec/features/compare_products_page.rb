# frozen_string_literal: true

require 'spec_helper'
RSpec.describe 'Testing compare products page', type: :feature do
  before do
    @item_page = ItemPage.new
    @home_page = HomePage.new
    @login_page = LoginPage.new
    @desktops_page = Desktops.new
    @item_categories_page = ItemCategories.new
    @compare_products_page = CompareProductsPage.new

    @home_page.load
  end

  it 'Check price of computer' do
    @home_page.selectPage('Computers')
    @item_categories_page.goToDesktops
    @desktops_page.selectSorter('Name: Z to A')
    @desktops_page.addToCartList
    expected_price = @item_page.getComputerPrice
    @item_page.addToCompareList
    
    expect(@compare_products_page.getProductPrice).to eq(expected_price.to_s)
  end
end