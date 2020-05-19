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
