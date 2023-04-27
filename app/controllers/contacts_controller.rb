class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  # create the contact form
  def create
  	binding.pry
    @contact = Contact.create(contact_params) if params.present?
    if @contact.save
      redirect_to root_path, notice: 'Contact form saved successfully.'
    else
      redirect_to contact_index_path, notice: 'Contact form not saved.'
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :contact_no, :message)
  end
end

