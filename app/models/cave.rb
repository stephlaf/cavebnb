class Cave < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :cave_amenities
  has_many :amenities, through: :cave_amenities

  mount_uploader :photo, PhotoUploader
end
