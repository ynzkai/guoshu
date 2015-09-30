class HomeController < ApplicationController
  def index
    @catalogs = Catalog.all
  end
end
