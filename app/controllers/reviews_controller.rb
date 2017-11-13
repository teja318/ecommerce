class ReviewsController < ApplicationController

 before_action :authenticate_user!, except: [:index, :show]
  def index
 	@reviews = Review.all
  end
  def create
	@review = Review.new(params[:review].permit(:product_id, :user_id, :body, :rating))
   @review.user_id = current_user.id

     respond_to do |format|
      if @review.save
        # Notification.review_confirmation(@review).deliver!
        format.html {redirect_to :back, notice: "successfully added review to the product"}
        format.js
      else
        format.js
      end
   end
  end
 def edit 
 	@review = Review.find(params[:id])
 end
 def show
  @review = Review.find(params[:id])
  @review.user_id = current_user.id
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
