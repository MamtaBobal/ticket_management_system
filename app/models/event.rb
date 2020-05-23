# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  event_date :datetime
#  fee        :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Event < ApplicationRecord
  
  # Validations
  validates :name, :event_date, presence: true

  # Associations
  has_many :user_events
  has_many :users, through: :user_events

  # female discount percentage
  FEMALE_DISCOUNT_PERC = 0.05

  # get event fee according to gender of the user
  def get_ticket_fee(user)
    user.female? ? fee * (1 - FEMALE_DISCOUNT_PERC) : fee
  end

  # verify past event or not
  def is_past_event?
    event_date.localtime < DateTime.now
  end

end
