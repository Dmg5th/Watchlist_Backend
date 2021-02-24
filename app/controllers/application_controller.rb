class ApplicationController < ActionController::API
    
    def current_user
        User.find[:session][:user_movies]
    end 

    def logged_in?
        !!current_user
    end 
end
