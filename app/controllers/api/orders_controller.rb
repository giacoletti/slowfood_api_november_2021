class Api::OrdersController < ApplicationController
  before_action :validate_params_presence, only: [:update]
  def create
    order = Order.create(order_params)
    product = Product.find(params[:order][:product_id])
    order.items.create(product: product)
    render json: { order: order }, status: :created
  end

  def update
    product = Product.find(params[:product_id])
    order = Order.find(params[:id])
    order.items.create(product: product)
    render json: { order: order, message: "#{product.name} has been added to your order" }, status: 200
  end

  private

  def order_params
    params[:order].permit(:user_id)
  end

  def validate_params_presence
    render json: { message: 'Missing product id' }, status: 422 if params[:product_id].nil?
  end
end
