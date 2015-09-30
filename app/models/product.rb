class Product < ActiveRecord::Base
  has_many :pictures, dependent: :destroy
  belongs_to :catalog

  accepts_nested_attributes_for :pictures
end
