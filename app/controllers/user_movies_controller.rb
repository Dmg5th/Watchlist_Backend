class UserMoviesController < ApplicationController

    def index
        if logged_in?
            @watchlist = current_user.user_movies
            
            render json: current_user.user_movies
        else 
            render json: {
                error: "You must be logged in to see your watchlist"
            }
        end 
    end 
end
