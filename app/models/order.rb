class Order < ActiveRecord::Base
  has_many :orderItems, dependent: :destroy
  belongs_to :reciever
  belongs_to :user

  STATE = %w(生成订单 填写收货人 等待付款 等待发货 确认收货 完成)

  def state_name
    STATE[self.state]
  end
end
