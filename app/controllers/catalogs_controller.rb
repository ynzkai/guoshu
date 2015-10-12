class CatalogsController < ApplicationController
  def subcatalogs
    @catalogs = Catalog.where parent: params[:id]
    respond_to do |format|
      format.json
    end
  end
end
