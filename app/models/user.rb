class User < ApplicationRecord
  has_many :infos
  has_many :appointments, through: :infos

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
