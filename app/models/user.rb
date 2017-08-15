class User < ApplicationRecord
  validates :nickname, :phone, uniqueness: true
  validates :nickname, length: { in: 3..10 }
  validates :phone, format: { with: /01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})/,
                              message: "휴대폰 번호가 아닙니다"}

  has_many :infos, dependent: :destroy
  has_many :appointments, through: :infos
  # TODO: 유저가 사라질 때 빌더인 약속은 지워지고, 그냥 참여만 한 약속은 남아있게 하기

  has_many :notifications, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def self.search(search)
    if search.present?
      where("nickname like ?", "%" + search + "%")
    else
      none
    end
  end

end
