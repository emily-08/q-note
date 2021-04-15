class MemosController < ApplicationController
  def index
    @memo = Memo.new
    @genre = Genre.find(params[:genre_id])
    @memos = @genre.memos.includes(:user)
  end

  def create
    @genre = Genre.find(params[:genre_id])
    @memo = @genre.memos.new(memo_params)
    if @memo.save
      redirect_to genre_memos_path(@genre)
    else
      @memos = @genre.memos.includes(:user)
      render :index
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:title, :text).merge(user_id: current_user.id)
  end
end