# require 'rails_helper'

# RSpec.describe 'Users', type: :request do
#   describe 'GET /users' do
#     it 'works! (now write some real specs)' do
#       get users_path
#       expect(response).to have_http_status(200)
#     end

#     it 'renders the index template' do
#       get users_path
#       expect(response).to render_template('index')
#     end

#     it 'the response body contains the string "Root view"' do
#       get users_path
#       expect(response.body).to include('Root view')
#     end
#   end
# end

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'response status was correct for /users' do
      get '/users'
      expect(response.status).to eq(200)
      expect(response.body).to include('Root view')
      expect(response).to render_template(:index)
    end

    it 'response status was correct for /users/:id' do
      get '/users/:234'
      expect(response.status).to eq(200)
      expect(response.body).to include('User page')
      expect(response).to render_template(:show)
    end
  end
end