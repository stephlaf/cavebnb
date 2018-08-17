class Booking < ApplicationRecord
  belongs_to :cave
  belongs_to :user

  include PgSearch
  multisearchable :against => [:checkin, :checkout, :status]

  def proposed?
    status == "proposed"
  end

  def cancelrequested?
    status == "cancelrequested"
  end

  def rejected?
    status == "rejected"
  end

  def accepted?
    status == "accepted"
  end

  def accept!
    self.status = "accepted"
    save
  end

  def reject!
    self.status = "rejected"
    save
  end


end
