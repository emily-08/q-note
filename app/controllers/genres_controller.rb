class GenresController < ApplicationController

  def index
    @genre = Genre.all
    @memos = Memo.order("created_at DESC")
  end

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