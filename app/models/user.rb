class User < ActiveRecord::Base
   has_many :cart_line_items
    has_many :reviews
    has_one :wish_list
    has_many :orders
    has_many :addresses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   validates :mobile , :username , presence: true 
   validates :mobile , numericality: true     
end
