class AuthenticationController < ApplicationController
    skip_before_action :authenticate, only: [:login, :register]

    def login
        @user = User.find_by(email: login_params[:email])
        if @user
            if(@user.authenticate(login_params[:password]))
                exp = 5.hours.from_now.to_i
                payload = { user_id: @user.id, exp: exp }
                token = create_token(payload)
                render json:
                {   
                    status: "Logged In",
                    token: token
                }
            else
                render json: { message: "Authentication Failed" }
            end
        else
            render json: { message: "Could not find user" }
        end
    end

    def register
        @user = User.new(register_params)
        if @user.save
            exp = 5.hours.from_now.to_i
            payload = { user_id: @user.id, exp: exp }
            token = create_token(payload)
            render json: 
            {
                status: :created,
                token: token
            }
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def login_params
        params.require(:login_info).permit(:email, :password)
    end

    def register_params
        params.require(:registration_info).permit(:email, :password, :password_confirmation, :name)
    end
end
