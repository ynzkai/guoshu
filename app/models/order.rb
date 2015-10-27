class Order < ActiveRecord::Base
  has_many :orderItems, dependent: :destroy
  belongs_to :reciever
  belongs_to :user

  STATE = %w(生成订单 填写收货人 待付款 待发货 已发货 确认收货 完成)

  def state_name
    STATE[self.state]
  end
end
