class Event < ApplicationRecord
  
  # Validations
  validates :name, :event_date, presence: true

  # Associations
  has_many :user_events
  has_many :users, through: :user_events

  # verify past event or not
  def is_past_event?
    self.event_date.localtime < DateTime.now
  end

end
