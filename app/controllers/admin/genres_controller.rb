class Admin::GenresController < ApplicationController
  def index
  end
  def create
  end
  def edit
  end
  def update
  end

  private
  def genre_params
    params.require(:genre).permit(:valid_flag, :name)
  end
end
