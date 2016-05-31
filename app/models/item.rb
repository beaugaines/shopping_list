class Item < ActiveRecord::Base
  has_many :list_items
  has_many :cart_items
  has_many :carts, through: :cart_items
end
