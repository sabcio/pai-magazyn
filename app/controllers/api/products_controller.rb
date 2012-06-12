class Api::ProductsController < Api::BaseController

  # http_basic_authenticate_with name: Settings.auth.login, password: Settings.auth.passwd,
  #    except: [:index, :show]

  def index
    @products = Product.all
    render xml: @products, only: [:name, :description, :stock, :price, :photo_url, :removed, :product_number],
      skip_types: true, dasherize: false
  end

  def show
    @product = Product.find_by_product_number(params[:id])
    render xml: @product, only: [:name, :description, :stock, :price, :photo_url, :removed, :product_number],
      skip_types: true, dasherize: false
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      render xml: @product, status: :created, location: @product
    else
      render xml: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by_product_number(params[:id])

    if @product.update_attributes(params[:product])
      head :no_content
    else
      render xml: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by_product_number(params[:id])
    @product.destroy

    head :no_content
  end
end
