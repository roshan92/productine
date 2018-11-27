module Api::V1
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]

    def_param_group :product do
      param :name, String, "Name of the product"
      param :description, String, "Details of the product"
      param :price, Integer, "Price of the product"
    end

    # GET /products
    api :GET, "/api/v1/products", "Get products"
    def index
      @products = Product.all
      render json: @products
    end

    # GET /products/1
    api :GET, "/api/v1/products/:id", "Get a specific product"
    def show
      render json: @product
    end

    # POST /products
    api :POST, "/api/v1/products", "Create a product"
    param_group :product
    def create
      @product = Product.new(product_params)

      if @product.save
        render json: @product, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1
    api :PUT, "/api/v1/products/:id", "Update a product"
    param_group :product
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # DELETE /products/1
    api :DELETE, "/api/v1/products/:id", "Delete a product"
    def destroy
      @product.destroy
      if @product.destroy
        head :no_content, status: :ok
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:name, :description, :price)
      end
  end
end
