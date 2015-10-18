class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :lineItems, dependent: :destroy
end
