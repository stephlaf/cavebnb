class Cave < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many :users, through: :bookings
  has_many :cave_amenities, dependent: :destroy
  has_many :amenities, through: :cave_amenities
  belongs_to :bed_type
  belongs_to :cave_type

  mount_uploader :photo, PhotoUploader

  def self.filter_by_amenity(amenity_id)
    Cave.joins(:cave_amenities).where(cave_amenities: { amenity_id: amenity_id })
  end
end
