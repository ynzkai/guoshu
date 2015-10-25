class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
  end

  def new
  end

  def edit
  end

  def pay
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

  def recieve
    @order = Order.find params[:id]
    if @order.reciever.update reciever_params
      @order.update state: 1
      render 'pay'
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
