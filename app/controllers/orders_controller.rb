class OrdersController < ApplicationController
  # before_action :set_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @order.accessories.build
    @order.order_overviews.build
  end

  def create
    @order = Order.new(order_params)
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
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to orders_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to orders_path, notice: "削除しました"
  end

  # def confirm
  #   @order = orders.build(order_params)
  #   render :new if @order.invalid?
  # end

  private
  def order_params
    params.require(:order).permit(:quantity, :remarks, :delivery, :acceptance_on, accessories_attributes: [:equipment, :parts, :numeral, :identification, :_destroy, :id], order_overviews_attributes: [:company, :department, :position, :name, :_destroy, :id])
  end
end