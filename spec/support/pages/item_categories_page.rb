#frozen_string_literal: true

require 'site_prism'

class ItemCategories < SitePrism::Page
  element :desktops_link_image, 'img[alt="Picture for category Desktops"]' #Element on Computers categorie
  element :item_gift_card_100dollar, 'img[alt="Picture of $100 Physical Gift Card"]' #Element on Gift Cards categorie
  element :item_denim_short, 'img[alt="Picture of Denim Short with Rhinestones"]' #Element on Apparel & Shoes categorie
  element :item_book_computing_and_internet, 'img[alt="Picture of Computing and Internet"]' #Element on Books categorie
  
  def goToDesktops; desktops_link_image.click end
  def goTo100DollarGiftCard; item_gift_card_100dollar.click end
  def goToBookComputingAndInternet; item_book_computing_and_internet.click end
  def goToDenimShort; item_denim_short.click end
end