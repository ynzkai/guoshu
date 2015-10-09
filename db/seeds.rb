# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Catalog.delete_all

root = Catalog.create(name: '分类', parent_id: 0, is_parent: true)

catalogs = %w(水果 蔬菜 肉类 海鲜 粮油 酒水 茶叶 干果 零食 其他)
catalogs.each do |c|
  Catalog.create(name: c, parent_id: root.id, is_parent: true)
end

catalogs = %w(草莓 菠萝 芒果 李子 西瓜 木瓜 哈密瓜 山竹 樱桃 香蕉 芒果 火龙果 苹果 梨 橘子 桂圆 葡萄 荔枝 其他)
catalog= Catalog.find_by name: '水果'
catalogs.each do |c|
  Catalog.create(name: c, parent_id: catalog.id)
end

catalogs = %w(蘑菇 洋葱 大葱 大蒜 韭菜 苋菜 芹菜 芦笋 黑木耳 冬瓜 青花菜 辣椒 茼蒿 芋头 黄瓜 胡萝卜 山药 扁豆 茴香 毛豆 黄花菜 莴笋 香菇 番茄 苦瓜 藕 土豆 南瓜 竹笋 豆类 萝卜 马铃薯 茄子 菠菜 银耳 姜 白菜 卷心菜 莲花白 大白菜 其他)
catalog= Catalog.find_by name: '蔬菜'
catalogs.each do |c|
  Catalog.create(name: c, parent_id: catalog.id)
end

catalogs = %w(猪里脊 猪排骨 猪腿肉 猪肉 牛肉 羊肉 鸡肉 鸭肉 其他)
catalog= Catalog.find_by name: '肉类'
catalogs.each do |c|
  Catalog.create(name: c, parent_id: catalog.id)
end

catalogs = %w(鱼 虾 螃蟹 甲鱼 其他)
catalog= Catalog.find_by name: '海鲜'
catalogs.each do |c|
  Catalog.create(name: c, parent_id: catalog.id)
end

catalogs = %w(菜籽油 花生油 橄榄油 混合油 大米 面粉 面条 其他)
catalog= Catalog.find_by name: '粮油'
catalogs.each do |c|
  Catalog.create(name: c, parent_id: catalog.id)
end

catalogs = %w(白酒 葡萄酒 洋酒 啤酒 乳品 饮料 咖啡 其他)
catalog= Catalog.find_by name: '酒水'
catalogs.each do |c|
  Catalog.create(name: c, parent_id: catalog.id)
end

catalogs = %w(红茶 花茶 绿茶 乌龙茶 黑茶 普洱茶 其他)
catalog= Catalog.find_by name: '茶叶'
catalogs.each do |c|
  Catalog.create(name: c, parent_id: catalog.id)
end

catalogs = %w(核桃 花生 板栗 大枣 其他)
catalog= Catalog.find_by name: '干果'
catalogs.each do |c|
  Catalog.create(name: c, parent_id: catalog.id)
end

catalogs = %w(饼干 面包 蛋糕 甜点 果脯 巧克力 其他)
catalog= Catalog.find_by name: '零食'
catalogs.each do |c|
  Catalog.create(name: c, parent_id: catalog.id)
end

