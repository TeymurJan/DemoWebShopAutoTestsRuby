# frozen_string_literal: true

require 'spec_helper'
RSpec.describe 'Testing Shopping cart page', type: :feature do
  before do 
    @shopping_cart_page = ShoppingCart.new
    @desktops_page = Desktops.new
    @item_page = ItemPage.new
    @home_page = HomePage.new
    @item_categories_page = ItemCategories.new
    @login_page = LoginPage.new
  end

  it 'Add item to shopping cart test' do
    @login_page.authorization
    @home_page.selectPage('Computers')
    @item_categories_page.goToDesktops
    @desktops_page.addToCartList
    @item_page.addToCartItem
    @home_page.goToShoppingCart

    expect(@shopping_cart_page.emptyShoppingCart).not_to eq('Your Shopping Cart is empty!')
  end
end