class ContactsController < ApplicationController
    
    # POST /contact/create
    def createContact
        puts "poop"
        @contact = Contact.new(contact_params.merge(user: :user_id))

        if @contact.save
            render json: @contact, status: :created, location: @contact
        else 
            render json: @contact.errors, status: :unprocessable_entity
        end
    end

    private
        def contact_params
            params.require(:contact_info).permit(:name, :email, :phone, :linkedin)
        end
end
  