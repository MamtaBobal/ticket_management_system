require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  context 'GET #index' do 
    let(:event) { create(:event) }

    it 'should success' do
      get :index, params: { event_id: event.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
