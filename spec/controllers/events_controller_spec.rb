require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  
  context 'GET #index' do 
    it "renders the :index view" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
