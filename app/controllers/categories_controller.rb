class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to @category
    else
      render :index
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
    puts "Products TEST"
    puts @products
  end

  def delete
    @category = Category.fing(params[:id])
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :thumburl)
  end
end
