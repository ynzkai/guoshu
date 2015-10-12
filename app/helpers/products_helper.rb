module ProductsHelper

  def catalog_links(c)

    if c.parent
      p = Catalog.find c.parent
      catalog_links(p) + ' / ' + link_to(c.name, catalog_path(c.id))
    else
      link_to('首页', root_url)
    end
  end
end
