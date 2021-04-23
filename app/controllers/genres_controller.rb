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

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to root_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name).merge(user_id: current_user.id)
  end
end