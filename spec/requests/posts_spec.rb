require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'return success for /posts' do
      get '/users/343/posts'
      expect(response.status).to eq(200)
      expect(response.body).to include('Posts for the specified user')
      expect(response).to render_template(:index)
    end
  end
end