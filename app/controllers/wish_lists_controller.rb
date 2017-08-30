class WishListsController < ApplicationController
 def index
 	@wish_lists = WishList.all
 	@cart_line_item = CartLineItem.new
 end
 def create
  @wish_list = WishList.new(params[:wish_list].permit(:user_id, :product_id))	
  @wish_list.user_id = current_user.id
  if @wish_list.save_or_update
  c = CartLineItem.find_by(user_id: @wish_list.user_id, product_id: @wish_list.product_id)
  c.destroy
  	redirect_to wish_lists_path, notice: "successfully added product to wishlist"
  end
  end	
  def destroy
	@wish_list = WishList.find(params[:id])
	@wish_list.destroy
	redirect_to wish_lists_path, notice: "successfully removed the product"
 end
end
