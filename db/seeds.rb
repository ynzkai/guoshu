# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 草莓 菠萝 芒果 李子 西瓜 木瓜 哈密瓜 山竹 樱桃 香蕉 芒果 火龙果 苹果 梨 橘子 桂圆 葡萄 荔枝
# 水果 蔬菜 肉类 海鲜 粮油 酒水 茶叶 干果 零食 其他

Catalog.delete_all

root = Catalog.create(name: '分类', parent_id: 0, is_parent: true)

catalogs = %w(水果 蔬菜 肉类 海鲜 粮油 酒水 茶叶 干果 零食 其他)
catalogs.each do |c|
  Catalog.create(name: c, parent_id: root.id, is_parent: true)
end

catalogs = %w(草莓 菠萝 芒果 李子 西瓜 木瓜 哈密瓜 山竹 樱桃 香蕉 芒果 火龙果 苹果 梨 橘子 桂圆 葡萄 荔枝)
catalog= Catalog.find_by name: '水果'
catalogs.each do |c|
  Catalog.create(name: c, parent_id: catalog.id)
end

catalogs = %w(猪肉 牛肉 鸡肉)
catalog= Catalog.find_by name: '肉类'
catalogs.each do |c|
  Catalog.create(name: c, parent_id: catalog.id)
end
