class LineItemsController < ApplicationController
  def create
    item = current_user.cart.lineItems.find_by product_id: params[:product_id]
    unless item
      current_user.cart.lineItems.create product_id: params[:product_id], count: params[:buycount]
    else
      item.count += params[:buycount].to_i
      item.save
    end

    respond_to do |format|
      format.json
    end

  end


  def destroy
    LineItem.destroy params[:id]
    respond_to do |format|
      format.html { redirect_to cart_path(current_user.cart), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
