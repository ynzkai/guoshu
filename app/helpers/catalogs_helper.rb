module CatalogsHelper
  def catalog_links(c)

    if c.parent
      p = Catalog.find c.parent
      catalog_links(p) + ' / ' + link_to(c.name, catalog_path(c.id))
    else
      link_to '首页', root_url
    end
  end

  def get_catalogs
    catalogs = {}
    parent_catalogs = Catalog.where(parent_id: Catalog.find_by(name: '分类').id)
    parent_catalogs.each do |c|
      cs = Catalog.where parent_id: c.id
      catalogs[c] = cs.to_a
    end
    return catalogs
  end
end
