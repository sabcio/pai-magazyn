class Api::OrdersController < Api::BaseController

  http_basic_authenticate_with name: Settings.auth.login, password: Settings.auth.passwd

  def index
    @orders = Order.all
    respond_to do |format|
      format.xml
    end
  end

  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.xml
    end
  end

end
