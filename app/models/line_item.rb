class LineItem < ActiveRecord::Base
  validates :count, presence: true

  belongs_to :cart
  belongs_to :product
end
