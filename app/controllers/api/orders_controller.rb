class Api::OrdersController < Api::BaseController

  http_basic_authenticate_with name: Settings.auth.login, password: Settings.auth.passwd

  def index
    @orders = Order.all
    render xml: @orders, only: [:number, :state, :id], include: :products
  end

  def show
    @order = Order.find(params[:id])
    render xml: @order, only: [:number, :state, :id], include: :products
  end

end
