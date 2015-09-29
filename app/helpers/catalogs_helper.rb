module CatalogsHelper
  def get_catalogs_html(name)
    cata = Catalog.find_by name: name
    return '' if cata.nil?

    html ||= ''
    html += '<ul>'
    html += '<li>' + name + '</li>'

    if cata.is_parent?
      Catalog.where(parent_id: cata.id).each do |c|
        get_catalogs_html(c.name)
      end
    else
      html += '<li>' + name + '</li>'
    end

    html += '</ul>'
  end

end
