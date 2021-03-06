class ApplicationController < ActionController::API
    before_action :authenticate

    def authenticate
        if request.headers["Authorization"]
            begin
                auth_header = request.headers["Authorization"]
                token = auth_header.split(" ")[1]
                decoded_token = JWT.decode(token, secret)
                payload = decoded_token.first
                user_id = payload["user_id"]
                @user = User.find(user_id)
            rescue => exception
                render json: { message: "Error: #{exception}"}, status: :forbidden
            end
        else
            render json: { message: "No Authorization header sent"}, status: :forbidden
        end
    end

    
    def secret
        secret = ENV['SECRET_KEY_BASE'] || Rails.application.credentials.secret_key_base
    end

    def create_token(payload)
        JWT.encode(payload, secret, "HS256")
    end

end
