require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  context "factory" do
    let(:user) { build(:user) }

    it "has a valid factory" do
      expect(user).to be_valid
    end
  end

  context "validations" do
    # Validation tests
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:gender) }
  end

  context "Gender enum" do
    it { should define_enum_for(:gender).with_values([:male, :female]) }
  end

  context "associations" do
    it { expect(user).to have_many(:user_events) }
    it { expect(user).to have_many(:events).through(:user_events) }
  end

end
