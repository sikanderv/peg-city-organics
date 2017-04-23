class ContactController < ApplicationController
  def contact_us
    @contact = Contact.all
  end
end
