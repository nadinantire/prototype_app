class OrdersController < ApplicationController
  # before_action :set_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.includes(:accessories, :order_overviews)
  end

  def new
    @order = OrderForm.new
  end

  def create
    @order = OrderForm.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @orders = Order.where(id: params[:id])

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
    params.permit(:quantity, :remarks, :delivery, :acceptance_on, :equipment, :parts, :numeral, :identification, :company, :department, :position, :name)
  end
end

  # def set_order
  #   @order = Order.find(params[:id])
  # end

