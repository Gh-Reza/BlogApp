require 'rails_helper'

RSpec.describe "Api::V1s", type: :request do
  describe "GET /posts" do
    it "returns http success" do
      get "/api/v1/posts"
      expect(response).to have_http_status(:success)
    end
  end

end
