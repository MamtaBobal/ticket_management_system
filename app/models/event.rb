class Event < ApplicationRecord
  
  # Validations
  validates :name, :event_date, presence: true

  # Associations
  has_many :user_events
  has_many :users, through: :user_events

  # get event fee according to gender of the user
  def get_ticket_fee(user)
    self.fee = self.fee - 0.05 * self.fee if user.gender == "female"
    return self.fee
  end

  # verify past event or not
  def is_past_event?
    self.event_date.localtime < DateTime.now
  end

end
