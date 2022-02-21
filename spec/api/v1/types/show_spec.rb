require "rails_helper"

RSpec.describe "types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/types/#{type.id}", params: params
  end

  describe "basic fetch" do
    let!(:type) { create(:type) }

    it "works" do
      expect(TypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("types")
      expect(d.id).to eq(type.id)
    end
  end
end
