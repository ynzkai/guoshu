class HomeController < ApplicationController
  include CatalogsHelper

  # skip_load_and_authorize_resource

  def index
    @q = Product.ransack(params[:q])

    @products = Product.all
    @catalogs = get_catalogs
  end
end
