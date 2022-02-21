require "rails_helper"

RSpec.describe "types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/types/#{type.id}", payload
  end

  describe "basic update" do
    let!(:type) { create(:type) }

    let(:payload) do
      {
        data: {
          id: type.id.to_s,
          type: "types",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(TypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { type.reload.attributes }
    end
  end
end
