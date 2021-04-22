class UsersController < ApplicationController
  
  # GET /users - for current information of the user
  def getProfile
    if @user
      render json: @user.to_json(:include => [:contacts, :jobs], :except => [:id, :password_digest])
    else
      render json: { message: "Could not find user"}
    end
  end

  # PATCH/PUT /users/1
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

  def update_params
    params.require(:update_info).permit(:email, :password)
  end
end
