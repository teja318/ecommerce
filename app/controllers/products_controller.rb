class ProductsController < ApplicationController



before_action :authenticate_user!, except: [:index, :show]
before_action :check_is_admin, except: [:index, :show]

def index
   sleep(1)
   if params[:offset]
   	@products = Product.offset(params[:offset]).limit(10)
   else
	@products = Product.limit(10)
   end
  respond_to do |format|
	format.html
	format.json {render json: {products: @products}}
  end
end 

def new
	@product = Product.new
end	

def create
@product = Product.new(params[:product].permit(:name, :category_id, :description, :price, :code, :cod_eligible, :stock))
 if @product.save
 	redirect_to products_path, notice: "successfully updated the product"
 else
 	render action: "new"
end
end

def show
	@product = Product.find(params[:id])
    @category = Category.find(@product.category_id)
     @cart_line_item = CartLineItem.new
     @review = Review.new
end	

def edit 
	@product = Product.find(params[:id])
	@review = Review.find(params[:id])
end	

def update 
	@product = Product.find(params[:id])
	if @product.update_attributes(params[:product].permit(:name, :category_id, :description, :price))
	redirect_to products_path(@product.id), notice: "successfully updated the product"
	else
		render action: "edit"
	end
end
def destroy
	@product = Product.find(params[:id])
    @product.destroy
    @review = Review.find(params[:id])
    redirect_to products_path, notice: "successfully destroyed the product"
end	
end
