class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /expertises
  # GET /expertises.json
  def index
    @categories = Category.all
  end

  # GET /expertises/1
  # GET /expertises/1.json
  def show
  end

  # GET /expertises/new
  def new
    @category = Category.new
  end

  # GET /expertises/1/edit
  def edit
  end

  # POST /expertises
  # POST /expertises.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expertises/1
  # PATCH/PUT /expertises/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expertises/1
  # DELETE /expertises/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
