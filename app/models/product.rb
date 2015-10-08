class Product < ActiveRecord::Base
  has_many :pictures, dependent: :destroy
  belongs_to :catalog
  has_many :likes, dependent: :destroy
  has_many :looks, dependent: :destroy

  # accepts_nested_attributes_for :pictures
end
