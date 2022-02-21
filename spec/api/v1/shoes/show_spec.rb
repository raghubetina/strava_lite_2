require "rails_helper"

RSpec.describe "shoes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/shoes/#{shoe.id}", params: params
  end

  describe "basic fetch" do
    let!(:shoe) { create(:shoe) }

    it "works" do
      expect(ShoeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("shoes")
      expect(d.id).to eq(shoe.id)
    end
  end
end
