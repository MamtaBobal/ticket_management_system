# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  gender                 :integer
#
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
