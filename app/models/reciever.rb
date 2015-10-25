class Reciever < ActiveRecord::Base
  validates :name, :address, :telephone, presence: true
  has_many :orders, dependent: :destroy
  belongs_to :user
end
