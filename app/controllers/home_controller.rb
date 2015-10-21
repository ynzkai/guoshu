class HomeController < ApplicationController
  include CatalogsHelper

  def index
    @products = Product.all
    @catalogs = get_catalogs
  end
end
