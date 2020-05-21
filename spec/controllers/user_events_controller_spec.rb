require 'rails_helper'

RSpec.describe UserEventsController, type: :controller do
  
  let(:user) { create(:user) }
  let(:event) { create(:event, event_date: DateTime.now + 1) }
  let(:past_event) {create(:event, event_date: DateTime.now - 1) }

  context 'POST #create' do

    it 'should return a new user_event' do
      sign_in user
      params = { event_id: event.id }
      expect { post(:create, params: params) }.to change(UserEvent, :count).by(1)
    end

    it 'should not return a new user_event if event is of past date' do
      sign_in user
      params = { event_id: past_event.id }
      expect { post(:create, params: params) }.to change(UserEvent, :count).by(0)
    end

  end

  context 'DELETE destroy' do
    let!(:user_event) { create(:user_event, user: user, event: event) }
    let!(:past_user_event) { create(:user_event, user: user, event: past_event) }

      it 'should delete a user_event' do
        sign_in user
        params = {
                    event_id: event.id
                 }
        expect { delete(:destroy, params: params) }.to change(UserEvent, :count).by(-1)
      end

      it 'should not delete a user_event if event is of past date' do
        sign_in user
        params = {
                    event_id: past_event.id
                 }
        expect { delete(:destroy, params: params) }.to change(UserEvent, :count).by(0)
      end
  end
end
