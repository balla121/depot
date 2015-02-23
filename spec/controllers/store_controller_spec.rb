require 'rails_helper'

RSpec.describe StoreController, type: :controller do

  describe "GET #index" do
    render_views
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      assert_select "#columns #side a", minimum: 4
    end
  end

end
