class ProductsController < ApplicationController
	
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
	end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to @product
  end


  private
    def product_params
      #if params[:product].present?
      params.require(:product).permit(:name, :price)
      #end
    end

end
