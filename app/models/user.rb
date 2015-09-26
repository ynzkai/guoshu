class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: { message: "请填写名称" }
  validates :username, uniqueness: { message: "名称已经存在" }
  validates :username, length: { in: 2..10, message: "名称字数不能超过2~10个" }
end
