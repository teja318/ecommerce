class Order < ActiveRecord::Base
belongs_to :user
has_many :order_line_items
belongs_to :address

validates_presence_of :order_number, :order_date, :user_id
after_create :copy_cart_line_items_to_order_line_items
after_create :empty_cart_line_items
after_create :calculate_total
def copy_cart_line_items_to_order_line_items 
user = self.user
user.cart_line_items.each do |line_item|
	order_line_item = OrderLineItem.new
	order_line_item.product_id = line_item.product_id
	order_line_item.quantity = line_item.quantity
	order_line_item.price = line_item.product.price
	order_line_item.total = line_item.quantity * line_item.product.price
    order_line_item.order_id = self.id
    order_line_item.save
end
end

def empty_cart_line_items
	user = self.user
	CartLineItem.delete(user.cart_line_items.pluck(:id))
end	
def calculate_total
	self.update_attributes(total: self.order_line_items.sum(:total))
end
end
