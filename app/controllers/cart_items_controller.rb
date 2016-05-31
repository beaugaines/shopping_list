class CartItemsController < ApplicationController

  def create
    @cart = Cart.find(params[:cart_item][:cart_id])
    cart_item = CartItem.new(cart_item_params)
    if cart_item.save
      redirect_to @cart, notice: 'Item added'
    end
  end

  def add
    cart_item = CartItem.find(params[:id])
    @cart = cart_item.cart
    if cart_item.update(in_cart: true)
      redirect_to @cart, notice: "Added #{cart_item.item.name}!"
    end
  end


  def destroy
    cart_item = CartItem.find(params[:id])
    @cart = cart_item.cart
    if cart_item.destroy
      redirect_to @cart, notice: "Added #{cart_item.item.name}!"
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :item_id, :quantity)
  end
end
