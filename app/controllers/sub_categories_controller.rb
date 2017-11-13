class SubCategoriesController < ApplicationController

  def index
    @sub_categories = SubCategory.all
  end
  def create
  	@sub_category = SubCategory.new(sub_category_params)
    if @sub_category.save
     redirect_to sub_categories_path
     else
     render action: "new"
     end
   end 

   def show
   	@sub_category = SubCategory.find(params[:id])

    @products = Product.where('sub_category_id = ?', @sub_category.id)
    #@reviews = Review.where('product_id = ?', )
   end
  


  private
  def sub_category_params
  	params[:sub_category].permit(:name,:category_id)
  end	

end
