require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #index' do
    context 'returns http success' do
      it 'rigth params and credentials return success', vcr: { cassette_name: 'twitter_api_ruby' } do
        get :index, params: { term: 'ruby' }
        expect(response).to have_http_status(:success)
        expect(@message).to_not be_present
      end

      it 'wrong credemtials return alert' do
        expect { get :index }.to raise_exception ActionController::UrlGenerationError
      end
    end
  end
end
