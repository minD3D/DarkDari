class User < ApplicationRecord
  has_many :location_infos
  has_many :location_apps, through: :location_infos

  has_many :money_infos
  has_many :money_apps, through: :money_infos

  has_many :notifications

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
