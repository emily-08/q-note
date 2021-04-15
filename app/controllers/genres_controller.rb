class GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name).merge(user_id: current_user.id)
  end
end