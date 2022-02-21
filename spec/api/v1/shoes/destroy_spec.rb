require "rails_helper"

RSpec.describe "shoes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/shoes/#{shoe.id}"
  end

  describe "basic destroy" do
    let!(:shoe) { create(:shoe) }

    it "updates the resource" do
      expect(ShoeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Shoe.count }.by(-1)
      expect { shoe.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
