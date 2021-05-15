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
                    message: "Log in successful.",
                    token: token
                }
            else
                render json: { message: "Username or password is incorrect." }
            end
        else
            render json: { message: "Username or password is incorrect." }
        end
    end

    def register
        if User.find_by(email: register_params[:email])
            render json: { message: "Email has been taken."}
        else
            @user = User.new(register_params)
            if @user.save
                exp = 5.hours.from_now.to_i
                payload = { user_id: @user.id, exp: exp }
                token = create_token(payload)
                render json: 
                {
                    status: :created,
                    message: "Registration successful.",
                    token: token
                }
            else
                render json: @user.errors, status: :unprocessable_entity
            end
        end
    end

    def login_params
        params.require(:login_info).permit(:email, :password)
    end

    def register_params
        params.require(:registration_info).permit(:email, :password, :password_confirmation, :name)
    end
end
