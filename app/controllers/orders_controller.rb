class OrdersController < ApplicationController

  # 0生成订单 1填写收货人 2待付款 3待发货 4已发货 5确认收货 完成
  def process_order
    @order = Order.find params[:id]
    case @order.state
    when 0
      render 'recieve'
    when 1
      render 'paytype'
    when 2
      pay
    when 3
      @order.update state: 4
      respond_to do |format|
        format.js { render :update_state }
      end
    when 4
      @order.update state: 5
      respond_to do |format|
        format.js { render :update_state }
      end
    when 5
      @order.update state: 6
      respond_to do |format|
        format.js { render :update_state }
      end
    else
      redirect_to :back
    end
  end

  def index
    @orders = current_user.orders
  end

  def show
  end

  def new
  end

  def edit
  end

  def paytype
    @order = Order.find params[:id]
    if @order.update pay_type: params[:order][:pay_type]
      if params[:order][:pay_type] == "0"
        @order.update state: 3
        # 货到付款
        render 'finish_order'
      else
        @order.update state: 2
        # 支付宝
      end
    end
  end

  def pay
  end

  def recieve
    @order = Order.find params[:id]
    if @order.reciever.update reciever_params
      @order.update state: 1
      render 'paytype'
    end
  end

  def create
    if current_user.cart.lineItems.count <= 0
      render 'carts/show'
      return
    end

    if current_user.reciever.nil?
      @reciever = Reciever.new user_id: current_user.id
      @reciever.save(validate: false)
    else
      @reciever = current_user.reciever
    end

    names = current_user.cart.lineItems.inject('') {|s, e| s+e.product.name+';'}
    total = current_user.cart.lineItems.inject(0) { |sum, e| sum + e.count * e.product.price }
    @order = current_user.orders.create title: names, total: total, reciever_id: @reciever.id
    current_user.cart.lineItems.each do |item|
      @order.orderItems.create product_id: item.product_id, count: item.count
    end
    current_user.cart.lineItems.delete_all
    render 'recieve'
  end

  def destroy
  end

  def update
  end

  protected

    def reciever_params
      params.require(:reciever).permit(:name, :address, :telephone)
    end
end
