class HomeController < ApplicationController
  def index
    @catalogs = Catalog.get Catalog.find_by name: '分类'
  end
end
