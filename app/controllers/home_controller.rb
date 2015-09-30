class HomeController < ApplicationController
  def index
    @catalogs = Catalog.all
    @products = Product.all
  end
end
