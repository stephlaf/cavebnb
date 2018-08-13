class Booking < ApplicationRecord
  belongs_to :cave
  belongs_to :user
end
