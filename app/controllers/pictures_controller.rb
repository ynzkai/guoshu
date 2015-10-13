class PicturesController < ApplicationController
  def new
    @picture = Picture.new product_id: params[:product_id]
  end

  def create
    @picture = Picture.new picture_params
    if @picture.save
      product = Product.unscoped.find picture_params[:product_id]
      product.update(state: 1) # change product state 
      redirect_to root_url
    end
  end

  def destroy
  end

  protected

  def picture_params
    params.require(:picture).permit(:pic, :product_id)
  end
end
