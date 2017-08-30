class WishList < ActiveRecord::Base
belongs_to :product
belongs_to :user
validates_presence_of :user_id, :product_id
validates_numericality_of :product_id, :user_id


end
