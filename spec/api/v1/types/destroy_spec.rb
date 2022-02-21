require "rails_helper"

RSpec.describe "types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/types/#{type.id}"
  end

  describe "basic destroy" do
    let!(:type) { create(:type) }

    it "updates the resource" do
      expect(TypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Type.count }.by(-1)
      expect { type.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
