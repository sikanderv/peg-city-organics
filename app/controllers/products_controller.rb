# Product contoller
class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    # @products = Product.all.order('created_at DESC')
    @products = Product.order('name').page(params[:page]).per(3)
    @order_item = current_order.order_items.new
    # @products = @products.search(params[:search]) if params[:search].present?
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  def result
    # @products = Product.all.order('created_at DESC')
    @products = Product.where('name LIKE :search OR description LIKE :search',
                              search: "%#{params[:search]}%")
  end

  def sale
    @products = Product.where(on_sale: true)
  end

  def latest
    @products = Product.order(created_at: :desc)
  end

  def categorized
    @products = Product.order(:category_id)
    # <% @category.products.each do |product| %>
    # <p>
    #     <b>Product:</b>
    #     <%= product.name %>
    # </p>
    # <% end %>
  end

  def checkout
    @order = current_order
    @order_items = current_order.order_items
    @order_subtotal = current_order.subtotal

    return unless user_signed_in?
    @order.user_id = current_user.id
    @order_pst = @order_subtotal * current_user.province.pst
    @order_gst = @order_subtotal * current_user.province.gst
    @order_hst = @order_subtotal * current_user.province.hst
    @total_tax = @order_hst + @order_gst + @order_pst
    @order.tax = @total_tax
    @order.total = @order_subtotal + @total_tax
    @order.order_status_id = 2
    @order.save!
  end

  # # GET /products/new
  # def new
  #   @product = Product.new
  # end

  # # GET /products/1/edit
  # def edit
  # end

  # # POST /products
  # # POST /products.json
  # def create
  #   @product = Product.new(product_params)
  #
  #   respond_to do |format|
  #     if @product.save
  #       format.html { redirect_to @product, notice: 'Product was successfully created.' }
  #       format.json { render :show, status: :created, location: @product }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  # def update
  #   respond_to do |format|
  #     if @product.update(product_params)
  #       format.html { redirect_to @product, notice: 'Product was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @product }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /products/1
  # DELETE /products/1.json
  # def destroy
  #   @product.destroy
  #   respond_to do |format|
  #     format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_product
  #     @product = Product.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def product_params
  #     params.require(:product).permit(:name, :description, :price)
  #   end
end
