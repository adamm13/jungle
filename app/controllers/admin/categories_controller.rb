class Admin::CategoriesController < ApplicationController

  
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def index
    @categories = Category.order(:name) #admin controller to show the index page
  end

  def new
    @category = Category.new #creates a new category
  end

  def create
    @category = Category.new(category_params) #creates a new category using the input params
    if @category.save
      redirect_to [:admin, :categories] #when submitted return to categories page
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end