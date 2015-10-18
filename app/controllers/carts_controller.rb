class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @total = current_user.cart.lineItems.inject(0) { |sum, e| sum + e.count * e.product.price }
  end
  
end

