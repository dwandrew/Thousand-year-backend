class ApplicationController < ActionController::Base
    include ActionController::Helpers
    include ActionController::Cookies
    skip_before_action :verify_authenticity_token
    helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!, :set_user
        
    # def jwt_key
    #   ENV['SESSION_SECRET']
    # end
    
    # def issue_token(user)
    #   JWT.encode({user_id: user.id}, jwt_key, 'HS256')
    # end
    
    # def decoded_token
    #   begin
    #     JWT.decode(token, jwt_key, true, { :algorithm => 'HS256' })
    #   rescue JWT::DecodeError
    #     [{error: "Invalid Token"}]
    #   end
    # end
    
    # def token
    #   request.headers['Authorization']
    # end
    
    # def user_id
    #   decoded_token.first['user_id']
    # end
    
    # def current_user
    #   user ||= User.find_by(id: user_id)
    # end
    
    # def logged_in?
    #   !!current_user
    # end
    

    def login!
      session[:user_id] = @user.id

    end

    def logged_in?
          !!session[:user_id]
    end

    def current_user
          @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorized_user?
           @user == current_user
    end

    def logout!
           session.clear
    end
    
    def set_user
        @user = User.find_by(id: session[:user_id])
    end

    
end
