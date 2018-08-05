require 'rails_helper'

RSpec.describe PayControllerController, type: :controller do

  describe "GET #pay" do
    it "returns http success" do
      get :pay
      expect(response).to have_http_status(:success)
    end
  end

end
