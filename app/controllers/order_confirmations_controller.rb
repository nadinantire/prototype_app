class OrderConfirmationsController < ApplicationController
  before_action :set_order_confirmation, only: %i[ show edit update destroy ]
  before_action :set_purchase, only: %i[ index new create edit]
  PER = 2

  def index
    @order_confirmations = OrderConfirmation.all
    @search = @order_confirmations.ransack(params[:q])
    @order_confirmations = @search.result(distinct: true).page(params[:page]).per(2)
  end

  def show
    @contractors = @order_confirmation.contractors
  end

  def new
    @order_confirmation = @purchase.build_order_confirmation
  end
  # binding.irb
  def create
    @order_confirmation = OrderConfirmation.new(order_confirmation_params)
    if params[:back]
      render :new
    else
      if @order_confirmation.save
        redirect_to purchase_order_confirmation_path(@purchase.id, @order_confirmation.id)
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @order_confirmation.update(order_confirmation_params)
      redirect_to purchase_order_confirmation_path(@order_confirmation.id), notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @order_confirmation.destroy
     if @order_confirmation == current_user
      redirect_to purchase_order_confirmations_path, notice: "削除しました"
     else
       render :edit
     end
  end

  private
  def order_confirmation_params
    params.require(:order_confirmation).permit(:firm, :department, :position, :name, :title, :acceptance_on, :purchase_id, contractors_attributes: [:price, :tax, :total, :due_on, :destroy, :id]).merge(user_id: current_user.id)
  end

  def purchase_params
    params.require(:purchase).permit(:firm, :department, :position, :name, :delivery, :acceptance_on, :title, orders_attributes: [:equipment, :parts, :numeral, :identification, :quantity, :remarks, :_destroy, :id])
  end

  def set_order_confirmation
    # binding.irb
    @order_confirmation = OrderConfirmation.find(params[:id])
  end

  def set_purchase
    @purchase = Purchase.find(params[:purchase_id])
  end
end
