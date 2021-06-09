class UsersController < ApplicationController
  # @user is taken from current token in header
  
  # GET /profile - for current information of the user
  def getProfile
    if @user
      render json: @user.to_json(:include => [{:contacts => {:only => :id}}, {:jobs => {:include => [{:timeline_times => {:only => :id}}], :only => :id}}], :except => [:id, :password_digest])
    else
      render json: { message: "Could not find user"}
    end
  end

  # PUT /profile/update/email - to update email of the user
  def updateEmail
    if @user
      if (@user.authenticate(update_params[:password]))
        if @user.update(email: update_params[:email])
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      else
        render json: { message: "Authentication Failed" }
      end
    else
      render json: { message: "Could not find user"}
    end
  end

  private
    def update_params
      params.require(:update_info).permit(:email, :password)
    end
end
