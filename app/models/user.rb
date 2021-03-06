class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: { message: "请填写名称" }
  validates :username, uniqueness: { message: "名称已经存在" }
  validates :username, length: { in: 2..10, message: "名称字数不能超过2~10个" }
  validates :agreement, acceptance: { message: "请在'我已阅读并同意用户注册协议'前打勾" }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_one :cart, dependent: :destroy
  has_one :reciever, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :likes, dependent: :destroy



  alias_method :cart_base, :cart

  def cart
    self.cart_base || create_cart
  end

  # 管理员
  ADMINS = %w(admin@guoshu.com ynzkai@gmail.com)

  def admin?
    ADMINS.include?(self.email) ? true : false
  end
end
