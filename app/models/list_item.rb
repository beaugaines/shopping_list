class ListItem < ActiveRecord::Base
  belongs_to :list
  belongs_to :item
  delegate :name, to: :item, prefix: true
end
