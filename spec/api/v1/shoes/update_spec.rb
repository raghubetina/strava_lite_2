require "rails_helper"

RSpec.describe "shoes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/shoes/#{shoe.id}", payload
  end

  describe "basic update" do
    let!(:shoe) { create(:shoe) }

    let(:payload) do
      {
        data: {
          id: shoe.id.to_s,
          type: "shoes",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ShoeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { shoe.reload.attributes }
    end
  end
end
