# frozen_string_literal: true

require 'site_prism'

class ContactUsPage < SitePrism::Page
  set_url '/contactus'
  element :fullname_input, '.fullname'
  element :email_input, '.email'
  element :text_area_enquiry, '.enquiry'
  element :submit_message_button, 'input[name="send-email"]'
  element :email_successfully_sent_text, '.result'

  def inputFullName(full_name) fullname_input.set full_name.to_s end
  def inputEmail(email) email_input.set email.to_s end
  def inputText(text) text_area_enquiry.set text.to_s end
  def submitMessageClick; submit_message_button.click end
  def successfullySent; email_successfully_sent_text.text end
end