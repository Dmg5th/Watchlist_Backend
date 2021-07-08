class MoviesController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
    
    def index
        movies = Movie.all

        render json: movies
    end 

    def create
        @movie = Movie.new(movie_params)
       
        if @movie.save
         render json: @movie, status: :created
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

    # def destroy
      
    #   @user.movie.destroy
    # end 

    private
    def set_user
      @user = User.find(params[:id])
      
    end
    
    def movie_params
        params.require(:movie).permit!
      end

end
