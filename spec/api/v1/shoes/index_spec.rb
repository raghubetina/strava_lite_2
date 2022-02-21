require "rails_helper"

RSpec.describe "shoes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/shoes", params: params
  end

  describe "basic fetch" do
    let!(:shoe1) { create(:shoe) }
    let!(:shoe2) { create(:shoe) }

    it "works" do
      expect(ShoeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["shoes"])
      expect(d.map(&:id)).to match_array([shoe1.id, shoe2.id])
    end
  end
end
