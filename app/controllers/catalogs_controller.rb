class CatalogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :subcatalogs]

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

  # The method used to get sub-catalogs acording to parent catalog in ajax way.
  def subcatalogs
    @catalogs = Catalog.where parent: params[:id]
    respond_to do |format|
      format.json
    end
  end
end
