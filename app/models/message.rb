class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  def message_time
    Date.today.strftime("%d - %m - %Y")
  end
end
