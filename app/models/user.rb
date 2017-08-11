class User < ApplicationRecord
  validates :nickname, uniqueness: true

  has_many :infos, dependent: :destroy
  has_many :appointments, through: :infos
  # TODO: 유저가 사라질 때 빌더인 약속은 지워지고, 그냥 참여만 한 약속은 남아있게 하기

  has_many :notifications, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # TODO: 닉네임, 전화번호 유효성검사(에러메세지 출력). Appointment, Info, Notification 모델들 전부 유효성 검사

  def self.search(search)
    if search.present?
      where("nickname like ?", "%" + search + "%")
    else
      none
    end
  end

end
