class Review < ApplicationRecord
  belongs_to :cave
  belongs_to :user
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3, 4, 5] }

  include PgSearch
  multisearchable :against => [:comment, :stars]

end
