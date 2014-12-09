require 'rails_helper'

RSpec.describe SessionController, :type => :controller do
  describe 'GET signin' do
    it 'returns success' do
      get :new 
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE signout' do

  end
end
