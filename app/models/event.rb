class Event < ApplicationRecord
  
  # Validations
  validates :name, :event_date, presence: true
end
