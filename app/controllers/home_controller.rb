class HomeController < ApplicationController
  include CatalogsHelper

  def index
    @q = Product.ransack(params[:q])

    @products = Product.all
    @catalogs = get_catalogs
  end
end
