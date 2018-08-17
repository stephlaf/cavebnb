class Cave < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_many :users, through: :bookings
  has_many :cave_amenities, dependent: :destroy
  has_many :amenities, through: :cave_amenities
  has_many :reviews
  belongs_to :bed_type
  belongs_to :cave_type
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  mount_uploader :photo, PhotoUploader

  def self.filter_by_amenity(amenity_id)
    Cave.joins(:cave_amenities).where(cave_amenities: { amenity_id: amenity_id })
  end

  include PgSearch
  multisearchable :against => [:name, :rating, :price, :availability, :description]


  pg_search_scope :global_search,
    against: [:name, :rating, :price, :availability, :description],
    associated_against: {
      amenities: [ :name, :icon, :description ],
      bookings: [ :checkin, :checkout, :status ],
      reviews: [ :comment, :stars ],
    },
    using: {
      tsearch: { prefix: true }
    }
end
