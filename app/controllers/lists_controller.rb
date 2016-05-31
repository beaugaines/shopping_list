class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to @list, notice: 'List saved'
    else
      flash[:alert] = 'List failed to save'
      render :new
    end
  end

  def show
    @list = List.includes(:items).find(params[:id])
    @items = Item.all
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
