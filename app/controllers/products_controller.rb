# Product contoller
class ProductsController < ApplicationController
  # before_action :tax, only: [:checkout]
  # before_action :total, only: [:checkout]

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
    @order.save!
  end
end
