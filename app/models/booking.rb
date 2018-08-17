class Booking < ApplicationRecord
  belongs_to :cave
  belongs_to :user

  include PgSearch
  multisearchable :against => [:checkin, :checkout, :status]

end
