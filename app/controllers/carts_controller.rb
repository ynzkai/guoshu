class CartsController < ApplicationController
  
  def additem
    current_user.cart.lineItems.create product_id: params[:product_id], count: params[:count]
  end

end

