class DashboardController < ApplicationController
  def home
  @categories = Category.all
  @products = Product.all
  @users = User.all
  @reviews = Review.all
  @orders = Order.all
  end

  def categories
    @categories = Category.all
  end

  def products
    @products = Product.all
  end

  def users
  @users = User.all
  end

  def reviews
  end

  def orders
  @orders = Order.all
  
  end
end
