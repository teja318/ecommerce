class CartLineItemsController < ApplicationController
 
 before_action :authenticate_user!, except: [:index, :show]
  
 def index
 @cart_line_items = current_user.cart_line_items
 @wish_list = WishList.new
 @order = Order.new
 
 end

 def create 
 @cart_line_item = CartLineItem.new(params[:cart_line_item].permit(:quantity, :product_id))
  # it create in show page  quantity , product_id & is displayed in the url
 @cart_line_item.user_id = current_user.id
  #if u are logedin it refers to the existing user_id

   if @cart_line_item.save_or_update
#it is used to select items required and save
 	redirect_to cart_line_items_path, notice: "successfully added product to the cart"
  #afetr saving cartlineitem it is use to return back & 
  end
 end
 
 def update 
 @cart_line_item = CartLineItem.find(params[:id])
 	if @cart_line_item.update_attributes(params[:cart_line_item].permit(:quantity))
 
 		
 	redirect_to cart_line_items_path, notice: "successfully updated the quantity to the product"
    end
 end 

 def destroy
	@cart_line_item = CartLineItem.find(params[:id])
	@cart_line_item.destroy
	redirect_to cart_line_items_path, notice: "successfully removed the product"
 end
end	




