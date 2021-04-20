class UsersController < ApplicationController
  
  # GET /users - for current information of the user
  def index
    if @user
      render json: @user.to_json(:include => [:contacts, :jobs], :except => [:id, :password_digest])
    else
      render json: { message: "Could not find user"}
    end
  end

  # PATCH/PUT /users/1 <- to-do
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

end
