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

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to genre_memos_path
  end

  def edit
    @memo = Memo.find(params[:id])
    @genre = Genre.find(params[:genre_id])
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def search
    @memos = Memo.search(params[:keyword])
  end

  private

  def memo_params
    params.require(:memo).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end