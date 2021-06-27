class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[ show edit update destroy ]
  PER = 2

  def index
    @purchases = Purchase.all
    @search = @purchases.ransack(params[:q])
    @purchases = @search.result(distinct: true).page(params[:page]).per(2)
  end

  def show
    @orders = @purchase.orders
  end

  def new
    @purchase = Purchase.new
    @purchase.orders.build
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if params[:back]
      render :new
    else
      if @purchase.save
        ContactMailer.contact_mail(@purchase).deliver
        redirect_to purchase_path(@purchase.id), notice: '発注の作成が完了しました。メールをご確認ください。'
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @purchase.update(purchase_params)
      redirect_to purchase_path(@purchase.id), notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @purchase.destroy
    if @purchase == current_user
      redirect_to purchases_path, notice: "削除しました"
    else
      render :edit
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:firm, :department, :position, :name, :delivery, :acceptance_on, :title, orders_attributes: [:equipment, :parts, :numeral, :identification, :quantity, :remarks, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end
end
