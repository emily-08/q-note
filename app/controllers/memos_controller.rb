class MemosController < ApplicationController
  def index
    @genre = Genre.all
  end
end
