class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]
  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end

  def show
    @movies = @list.movies
    @bookmarks = @list.bookmarks
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'Bookmark was successfully removed.'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
