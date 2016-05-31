class ListItemsController < ApplicationController
  def create
    @list = List.find(params[:list_item][:list_id])
    list_item = ListItem.new(list_item_params)
    if list_item.save
      redirect_to @list, notice: 'Item added'
    end
  end

  private

  def list_item_params
    params.require(:list_item).permit(:list_id, :item_id, :quantity)
  end
end
