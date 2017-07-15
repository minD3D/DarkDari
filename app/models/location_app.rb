class LocationApp < ApplicationRecord
  has_many :location_infos, dependent: :destroy
  has_many :users, through: :location_infos
end
