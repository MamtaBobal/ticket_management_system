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
require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:event) { create(:event) }

  context "factory" do
    let(:event) { build(:event) }

    it "has a valid factory" do
      expect(event).to be_valid
    end
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:event_date) }
  end

  context "associations" do
    it { expect(event).to have_many(:user_events) }
    it { expect(event).to have_many(:users).through(:user_events) }
  end

  context "public instance methods" do
    context "responds to its methods" do
      it { expect(event).to respond_to(:get_ticket_fee) }
      it { expect(event).to respond_to(:is_past_event?) }
    end

    context "executes methods correctly" do
      context "get_ticket_fee" do
        context "if gender is male" do
          let(:male_user) { create(:user, gender: "male") }
          let(:user_event) { create(:user_event, user_id: male_user.id, event_id: event.id) }

          it "returns same ticket fee" do
            expect(event.get_ticket_fee(male_user)).to eq(event.fee)
          end
        end

        context "if gender is female" do
          let(:female_user) { create(:user, gender: "female") }
          let(:user_event) { create(:user_event, user_id: female_user.id, event_id: event.id) }

          it "returns discounted fee" do
            discounted_fee = event.fee - 0.05 * event.fee
            expect(event.get_ticket_fee(female_user)).to eq(discounted_fee)
          end
        end
      end

      context "is_past_event?" do
        let(:event) { create(:event, event_date: DateTime.now - 1) }

        it "returns true if event is an past event" do
          expect(event.is_past_event?).to eq(true)
        end
      end
    end
  end

end
