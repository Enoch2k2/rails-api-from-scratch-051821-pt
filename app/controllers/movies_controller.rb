class MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_movie, only: [:show, :update, :destroy]

  def index
    # respond_to do |f|
    #   f.html
    #   f.json { render json: Movie.all }
    # end for hybrid of rails and api
    render json: Movie.all, include: [:genres], only: [:title]
  end

  def show
    render json: @movie, include: [genres: { only: [:name] }], only: [:title]
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie
    else
      render json: { errors: @movie.errors.full_messages }
    end
  end
  
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: { errors: @movie.errors.full_messages }
    end
  end

  def destroy
    if @movie
      @movie.destroy
      render json: @movie
    else
      render json: { errors: [ "Movie Not Found" ]}
    end
  end


  private
    def set_movie
      @movie = Movie.find_by_id(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title)
    end
end
