class ContactsController < ApplicationController

    # POST /contact/create
    def createContact
        @contact = Contact.new(contact_params.merge(user: @user))

        if @contact.save
            render json: @contact, status: :created
        else 
            render json: @contact.errors, status: :unprocessable_entity
        end
    end

    # PUT /contact/
    def updateContact
        if @contact.update(contact_params)
            render json: @contact
          else
            render json: @contact.errors, status: :unprocessable_entity
          end
    end

    private
        def set_contact
            @contact = Contact.find(params[:id])
        end

        def contact_params
            params.require(:contact_info).permit(:name, :email, :phone, :linkedin)
        end
end
  