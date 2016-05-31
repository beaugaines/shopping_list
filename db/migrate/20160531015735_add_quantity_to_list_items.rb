class AddQuantityToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :quantity, :integer
  end
end
