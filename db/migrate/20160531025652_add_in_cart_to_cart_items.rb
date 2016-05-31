class AddInCartToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :in_cart, :boolean, default: false
  end
end
