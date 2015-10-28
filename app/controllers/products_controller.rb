class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]
  before_action :set_product, only: [:show, :edit, :update, :destroy, :like, :look, :add, :down]
  load_and_authorize_resource :product

  # GET /products
  # GET /products.json
  def index
    @products = Product.unscoped.all.reverse
  end

  # GET /products/1
  # GET /products/1.json
  def show
    if user_signed_in?
      @product.looks.create(user_id: current_user.id)
    else
      @product.looks.create
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    @parent_catalogs = Catalog.where parent: Catalog.find_by(name: '分类').id
    @catalogs = Catalog.where parent: @parent_catalogs.first.id
  end

  # GET /products/1/edit
  def edit
    @parent_catalogs = Catalog.where parent: Catalog.find_by(name: '分类').id
    @catalogs = Catalog.where parent: @parent_catalogs.first.id
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to new_product_picture_url(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    like_item = @product.likes.find_by(user_id: current_user.id)
    if like_item
      @product.likes.destroy like_item
    else
      @product.likes.create(user_id: current_user.id)
    end

    @likes = @product.likes.count
    respond_to do |format|
      format.js
    end
  end

  def add
    @product.update state: 2
    respond_to do |format|
      format.js
    end
  end

  def down
    @product.update state: 3
    respond_to do |format|
      format.js
    end
  end

  def search
    @q = Product.ransack(params[:q])
    @products = @q.result.includes(:catalog)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.unscoped.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :unit, :amount, :pic, :catalog_id, :state)
    end
end
