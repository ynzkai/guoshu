module ApplicationHelper
  # 枚举某一节点下的所有分类
  # 示例: <%= get_catalogs_html('分类') %>

  def get_catalogs_html(name)
    cata = Catalog.find_by name: name
    return '' if cata.nil?

    if cata.is_parent?
      html = '<ul><li>' + name + '</li>'
      Catalog.where(parent_id: cata.id).each do |c|
          html += get_catalogs_html(c.name)
      end
      html += '</ul>'
    else
      '<li>' + name + '</li>'
    end

  end
end
