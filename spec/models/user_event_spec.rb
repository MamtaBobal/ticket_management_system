# == Schema Information
#
# Table name: user_events
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe UserEvent, type: :model do

  let(:user_event) { create(:user_event) }

  context "factory" do
    let(:user_event) { build(:user_event) }

    it "has a valid factory" do
      expect(user_event).to be_valid
    end
  end

  context "associations" do
    it { expect(user_event).to belong_to(:event) }
    it { expect(user_event).to belong_to(:user) }
  end
end
