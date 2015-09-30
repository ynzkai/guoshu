class Catalog < ActiveRecord::Base
  has_many :subcatalogs, class_name: Catalog, foreign_key: "parent_id" 
  belongs_to :parent, class_name: Catalog

  def self.get(cata)
    result ||= []

    if cata.is_parent?
      Catalog.where(parent_id: cata.id).each do |c|
        self.get(c)
      end
    else
      result << cata
    end

  end

end
