class Product < ActiveRecord::Base
  has_many :cart_line_items
 has_many :reviews
 has_many :order_line_items
  has_one :wish_list
  belongs_to :category

  validates_presence_of :name, :price, :description, :category_id
  validates_numericality_of :price, :category_id, greater_than_or_equal_to:1

end