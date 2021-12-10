class Api::OrdersController < ApplicationController
  def create
    order = Order.create(order_params)
    render json: { order: order }, status: :created
  end

  private

  def order_params
    params[:order].permit(:user_id)
  end
end

# generate user model
# migrate add_users_to_orders
# create models order_spec
# create models user_spec
# add order belongs to user
# add user has many orders
# add factory bot for user
# update requests spec
