class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, status: 200
  end

  def create
    product = Product.new(
      name: prod_params[:data][:name],
      brand: prod_params[:data][:brand],
      price: prod_params[:data][:price],
      description: prod_params[:data][:description]
    )
    if product.save
      render json: product, status: 200
    else
      render json: {message: "Product not created!!"}
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    if product
      render json: product, status: 200
    else
      render json: {message: "No Found"}
    end
  end

  private
    def prod_params
      params.require(:payload).permit([
                                        data: [
                                          :name,
                                          :brand,
                                          :price,
                                          :description

                                        ]])
    end
end
