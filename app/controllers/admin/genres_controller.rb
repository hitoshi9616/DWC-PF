class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genre_path(@genre.id)
    else
      render :edit
    end
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to admin_genre_path(genre.id)
    else
      @genres = Genre.all
      render index
  end

  def destroy
  end

end
