class UserMoviesController < ApplicationController
    before_action :set_user_movie, only: [:show, :update, :destroy]


    def index
        if logged_in?
            @watchlist = current_user.movies
            
            render json: @watchlist
        else 
            render json: {
                error: "You must be logged in to see your watchlist"
            }
        end 
    end 
     # GET /watchlist/1
  def show
    render json: @watchlist
  end

  # POST /watchlist
  def create
    @watchlist = current_user.user_movies.build(user_movie_params)
    
    if @watchlist.save
      @movie = @watchlist.movie
      render json:  @movie, status: :created
    else
      error_resp = {
        error: @watchlist.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /watchlist/1
  def update
    if @watchlist.update(user_movie_params)
      render json:  @watchlist, status: :ok
    else
      error_resp = {
        error: @watchlist.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  # DELETE /user_movie/1
  def destroy
    if @watchlist.destroy
      render json:  { data: "Watchlist successfully destroyed" }, status: :ok
    else
      error_resp = {
        error: "Watchlist not found and not destroyed"
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_movie
      @watchlist = UserMovie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_movie_params
      params.require(:user_movie).permit!
    end
end

