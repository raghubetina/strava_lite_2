require "rails_helper"

RSpec.describe "types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/types", params: params
  end

  describe "basic fetch" do
    let!(:type1) { create(:type) }
    let!(:type2) { create(:type) }

    it "works" do
      expect(TypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["types"])
      expect(d.map(&:id)).to match_array([type1.id, type2.id])
    end
  end
end
