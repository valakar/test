class Api::ProductsController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  def index
    render json: products
  end

  def show
    render json: product
  end

  def create
    product = products.create!(product_params)
    render json: product
  end

  # def update
  #   @product = Product.find(params[:id])
  #   if @product.update_attributes(product_params)
  #     redirect_to @product
  #   else
  #     render :index
  #   end
  # end

  def update
    product.update_attributes(product_params)
    render nothing: true
  end

  #def delete
  #  render json: product
  #end

  def destroy
     product.destroy
     render nothing: true
  end

  # def new
  #   @product = Product.new
  #   @categories = Category.all
  # end

  # def create
  #   @product = Product.new(product_params)
  #   if @product.save
  #     redirect_to products_path
  #   end
  # end

  # def edit
  #   @product = Product.find(params[:id])
  #   @categories = Category.all
  # end


  



  # def destroy
  #   Product.find(params[:id]).destroy
  #   redirect_to products_path
  # end

  private
  def product
  	@product ||= Product.find(params[:id])
  end

  def products
  	@products ||= Product.all  
  end

  def product_params
    params.require(:product).permit(:name,:description, :thumburl, :category_id)
  end
end
