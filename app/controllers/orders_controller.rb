class OrdersController < ApplicationController
  # before_action :set_order, only: [:index, :show, :edit, :update, :destroy]
  def index
    @orders = Order.includes(:accessories)
  end

  def new
    @order = OrderForm.new
    # @order.build_accessories
  end

  def create
    binding.irb
    @order = OrderForm.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @order = Order.find(params[:id])
    @order.accessories.build
  end

  def update
    if @order.update(order_params)
      redirect_to order_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: "削除しました"
  end

  def confirm
    @order = orders.build(order_params)
    render :new if @order.invalid?
  end

  private
  def order_params
    params.permit(:quantity, :remarks, :delivery, :acceptance_on, :equipment, :name, :numeral, :identification)
  end
end

  # def set_order
  #   @order = Order.find(params[:id])
  # end

