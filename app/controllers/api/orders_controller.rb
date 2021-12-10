class Api::OrdersController < ApplicationController
  # before_action :set_order_status, only: [:update]

  def create
    order = Order.create(order_params)
    product = Product.find(params[:order][:product_id])
    order.items.create(product: product)
    render json: {
      order: order.serialized,
      message: "#{product.name} was added to your order"
    }, status: :created
  end

  def update
    product = Product.find(params[:product_id])
    order = Order.find(params[:id])
    order.items.create(product: product)
    render json: {
      order: order.serialized,
      message: "#{product.name} was added to your order"
    }, status: 200
  end

  private

  # def set_order_status 
  #   # update the order status
  #   render json: { message: "Order status updated to #{params[:order][:status]}" }, status: 200 if params[:order][:status]
  # end

  def order_params
    params[:order].permit(:user_id)
  end
end
