class Admin::UsersController < ApplicationController
    before_action :admin_user
    # before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
    def index
      @orders = Order.all
    end

    def new
      @order = Order.new
      @order.accessories.build
      @order.order_overviews.build
    end

    def create
      @order = current_user.orders.build(order_params)
      if @order.save
        redirect_to admin_user_path(@user.id)
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
        redirect_to admin_user_path(@user.id), notice: "編集しました"
      else
        render :edit
      end
    end

    def destroy
      Order.find(params[:id]).destroy
      redirect_to admin_usera_path, notice: "削除しました"
    end

    # def confirm
    #   @order = orders.build(order_params)
    #   render :new if @order.invalid?
    # end

    private
    def order_params
      params.require(:order).permit(:quantity, :remarks, :delivery, :acceptance_on, accessories_attributes: [:equipment, :parts, :numeral, :identification, :_destroy, :id], order_overviews_attributes: [:company, :department, :position, :name, :_destroy, :id])
    end

    def admin_user
      redirect_to orders_path unless current_user.admin == "管理者"
      flash[:notice] = "管理者画面です"
    end
  
    # def set_user
    #   @user =  User.find(params[:id])
    # end
  end