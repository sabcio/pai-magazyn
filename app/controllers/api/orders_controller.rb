class Api::OrdersController < Api::BaseController

  def index
    @orders = Order.all
    render xml: @orders, only: [:number, :state, :id], include: :products
    # respond_to do |format|
      # format.xml  { render :xml => @posts }
    # end
  end

  def show
    @order = Order.find(params[:id])
    render xml: @order, only: [:number, :state, :id]
  end

  def create
    @order = Order.new(params[:order])

    if @order.save
      render xml: @order, status: :created, location: @order
    else
      render xml: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(params[:order])
      head :no_content
    else
      render xml: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    head :no_content
  end
end
