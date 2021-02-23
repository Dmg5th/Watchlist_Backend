class UserMoviesController < ApplicationController

    def index
        watchlist = UserMovie.all

        render json: watchlist
    end 
end
