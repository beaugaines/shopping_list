class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  # GET /carts
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  def show
    @cart_items = @cart.cart_items.order(in_cart: :asc)
    @items = Item.all
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
    else
      render :new
    end
  end

  def populate
    @list = List.find(params[:list_id])
    @list.list_items.each do |list_item|
      @cart.cart_items.create(
        item: list_item.item,
        quantity: list_item.quantity
      )
    end
    redirect_to @cart, notice: 'Items added'
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
    redirect_to root_path, notice: 'Cart was successfully destroyed.'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params[:cart]
    end
end
