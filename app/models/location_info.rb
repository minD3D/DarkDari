class LocationInfo < ApplicationRecord
  belongs_to :user
  belongs_to :location_app
end
