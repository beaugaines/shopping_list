class CartItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart
  delegate :name, to: :item, prefix: true
end
