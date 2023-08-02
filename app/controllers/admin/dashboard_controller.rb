class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["JUNGLE_USERNAME"], password: ENV["JUNGLE_PASSWORD"]
  def show
    @products = Product.all 
    @categories = Category.all
    @products_count = @products.count 
    @categories_count = @categories.count 
  end
end
