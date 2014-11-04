class ProductsController < ApplicationController
  before_action :authorize,          only: %i[new create edit update destroy]
  before_action :set_product_params, only: %i[create update]

  load_and_authorize_resource

  def create
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def update
    if @product.update_attributes(params[:product])
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
  end

  private

  def set_product_params
    params[:product] = params.require(:product).permit(:name, :description, :price)
  end
end
