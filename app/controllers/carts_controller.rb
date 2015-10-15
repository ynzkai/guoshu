class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def addItem
    current_user.cart.lineItems.create product_id: params[:product_id], count: params[:count]

    respond_to do |format|
      format.json
    end

  end

end

