class Api::LineItemsController < Api::BaseController

  http_basic_authenticate_with name: Settings.auth.login, password: Settings.auth.passwd

  def index
    @order = Order.find(params[:order_id])
    @line_items = @order.products
    render xml: @line_items,
      skip_types: true, dasherize: false
  end

  def show
    @order = Order.find(params[:order_id])
    @line_item = @order.products.find(params[:id])
    render xml: @line_item,
      skip_types: true, dasherize: false
  end

  def update
    @order = Order.find(params[:order_id])
    @line_item = @order.products.find(params[:id])

    if @line_item.update_attributes(params[:line_item])
      head :no_content
    else
      render xml: @line_item.errors, status: :unprocessable_entity
    end
  end

end
