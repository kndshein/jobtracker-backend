class AuthenticationController < ApplicationController
    skip_before_action :authenticate, only: [:login]

    def login
        @user = User.find_by(email: params[:email])
        if @user
            if(@user.authenticate(params[:password]))
                exp=1.days.from_now.to_i
                payload = {user_id: @user.id, exp: exp}
                secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
                
                token = create_token(payload)
                render json:
                {
                    email: @user.email,
                    token: token
                }
            else
                render json: { message: "Authentication Failed"}
            end
        else
            render json: { message: "Could not find user"}
        end
    end
end
