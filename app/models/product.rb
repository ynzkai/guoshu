class Product < ActiveRecord::Base
  has_many :pictures, dependent: :destroy
  belongs_to :catalog
  has_many :likes, dependent: :destroy
  has_many :looks, dependent: :destroy

  default_scope {where(state: 2).order("created_at desc")}

  # accepts_nested_attributes_for :pictures

  STATE = %w(无图片 就绪 已上架 已下架)

  def state_name
    unless state.nil?
      STATE[state]
    else
      '无效'
    end
  end
end
