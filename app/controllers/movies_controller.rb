class MoviesController < ApplicationController
    def index
        movies = Movie.all

        render json: movies
    end 

    def create
        @movie = Movie.new(movie_params)
        byebug
        if @movie.save
         
          render json: @movie, status: :created
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      private
    
    def movie_params
        params.require(:movie).permit!
      end

end
