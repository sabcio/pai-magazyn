class Api::LineItemsController < Api::BaseController

  http_basic_authenticate_with name: Settings.auth.login, password: Settings.auth.passwd

  def index
    @order = Order.find(params[:order_id])
    @items = @order.products
    respond_to do |format|
      format.xml
    end
    # render xml: @line_items,
    #   skip_types: true, dasherize: false
  end

  def show
    @order = Order.find(params[:order_id])
    @item = @order.products.find(params[:id])
    respond_to do |format|
      format.xml
    end
    # render xml: @item,
    #   skip_types: true, dasherize: false
  end

  def update
    @order = Order.find(params[:order_id])
    @item = @order.products.find(params[:id])

    if @item.update_attributes(params[:product])
      head :no_content
    else
      render xml: @item.errors, status: :unprocessable_entity
    end
  end

end
