class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /professors
  # GET /professors.json
  def index
    @products = Product.all
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
  end

  # GET /professors/new
  def new
    @product = Product.new
  end

  # GET /professors/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /professors
  # POST /professors.json
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  # PATCH/PUT /professors/1
  # PATCH/PUT /professors/1.json
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :new
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
   	redirect_to products_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, category_ids:[])
    end
	

end
