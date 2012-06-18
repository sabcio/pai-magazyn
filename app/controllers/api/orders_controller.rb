class Api::OrdersController < Api::BaseController

  http_basic_authenticate_with name: Settings.auth.login, password: Settings.auth.passwd

  def index
    @orders = Order.not_closed
    respond_to do |format|
      format.xml
    end
  end

  def show
    @order = Order.not_closed.find(params[:id])
    respond_to do |format|
      format.xml
    end
  end

  def update
    @order = Order.not_closed.find(params[:id])

    if @order.update_attributes(params[:order])
      head :no_content
    else
      render xml: @order.errors, status: :unprocessable_entity
    end
  end


end
