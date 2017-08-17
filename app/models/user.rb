class User < ApplicationRecord
  validates :nickname, :phone, uniqueness: true
  validates :nickname, length: { in: 3..10 }
  validates :phone, format: { with: /01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})/,
                              message: "휴대폰 번호가 아닙니다"}
  before_destroy :destroy_appointments

  has_many :infos, dependent: :destroy
  has_many :appointments, through: :infos

  has_many :notifications, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # destroy appointments whose builder is current user
  def destroy_appointments
    self.infos.where(builder: true).each do |info|
      info.appointment.destroy
    end
  end

  def self.search(search)
    if search.present?
      where("nickname like ?", "%" + search + "%")
    else
      none
    end
  end

end
