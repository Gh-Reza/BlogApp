require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'return success for /posts' do
      get '/users/343/posts'
      expect(response.status).to eq(200)
      expect(response.body).to include('Posts for the specified user')
      expect(response).to render_template(:index)
    end

    it 'return success for /posts/:user_id' do
      get '/users/23/posts/234'
      expect(response.status).to eq(200)
      expect(response.body).to include('The specified post for specified user')
      expect(response).to render_template(:show)
    end
  end
end