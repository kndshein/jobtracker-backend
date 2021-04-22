class ContactsController < ApplicationController
    before_action :set_contact, only: [:updateContact, :deleteContact]

    # POST /contact/create
    def createContact
        @contact = Contact.new(contact_params.merge(user: @user))

        if @contact.save
            render json: @contact.to_json(:except => :user_id), status: :created
        else 
            render json: @contact.errors, status: :unprocessable_entity
        end
    end

    # PUT /contact/:id
    def updateContact
        if @contact.user_id == @user.id
            if @contact.update(contact_params)
                render json: @contact.to_json(:except => :user_id)
            else
                render json: @contact.errors, status: :unprocessable_entity
            end
        else
            render json: { message: "Contact does not belong to User"}
        end
    end

    # DELETE /contact/:id
    def deleteContact
        if @contact.user_id == @user.id
            if @contact.destroy
                render json: { message: "Contact deleted" }
            else
                render json: @contact.errors, status: :unprocessable_entity
            end
        else
            render json: { message: "Contact does not belong to User"}
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
  