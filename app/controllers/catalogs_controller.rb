class CatalogsController < ApplicationController
  include CatalogsHelper

  def index
    @catalogs = get_catalogs
  end

  def show
    @catalog = Catalog.find params[:id]
    catalogs = Catalog.where parent: @catalog.id
    if catalogs.any?
      @products = Product.where catalog_id: catalogs.ids
    else
      @products = @catalog.products
    end
  end

  def subcatalogs
    @catalogs = Catalog.where parent: params[:id]
    respond_to do |format|
      format.json
    end
  end
end
