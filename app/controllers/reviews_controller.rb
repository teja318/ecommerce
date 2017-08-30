class ReviewsController < ApplicationController

 before_action :authenticate_user!, except: [:index, :show]
  def index
 	@reviews = Review.all
  end
 def create
	@review = Review.new(params[:review].permit(:product_id, :user_id, :body, :rating))
   
   @review.user_id = current_user.id

   if @review.save
    Notification.review_confirmation(@review).deliver!
   redirect_to :back, notice: "successfully added review to the product" 
   end
 end
 def edit 
 	@review = Review.find(params[:id])
 end
 
 def update
  @review = Review.find(params[:id])
  if @review.update_attributes(params[:review].permit(:product_id, :user_id, :body, :rating))
    redirect_to reviews_path(@review.id)
    else
    render action: "edit"
  end
 end
 def destroy
  @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back, notice: "successfully destroyed the product"
  
 end 	
end
