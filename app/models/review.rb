class Review < ActiveRecord::Base
belongs_to :product
belongs_to :user

validates_presence_of :product_id, :user_id, :body, :rating
validates_numericality_of :product_id, :rating
validates_numericality_of :rating, within: 1..5


end
