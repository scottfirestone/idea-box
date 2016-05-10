require "rails_helper"
RSpec.describe IdeasController, type: :controller do
  describe "GET #index" do
    it "returns ideas" do
      idea = create_list(:idea, 2)

      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
