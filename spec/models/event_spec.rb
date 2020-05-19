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

end
