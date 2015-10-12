class HomeController < ApplicationController
  def index
    #@catalogs = Catalog.all
    @products = Product.all.limit(4)

    @catalogs = {}
    parent_catalogs = Catalog.where(parent_id: Catalog.find_by(name: '分类').id)
    parent_catalogs.each do |c|
      catalogs = Catalog.where parent_id: c.id
      @catalogs[c] = catalogs.to_a
    end
  end
end
