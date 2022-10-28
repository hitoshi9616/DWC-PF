class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      @genre = Genre.new
      render :index
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:genre)
  end

end
