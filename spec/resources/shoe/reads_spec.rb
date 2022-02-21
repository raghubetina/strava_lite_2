require "rails_helper"

RSpec.describe ShoeResource, type: :resource do
  describe "serialization" do
    let!(:shoe) { create(:shoe) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(shoe.id)
      expect(data.jsonapi_type).to eq("shoes")
    end
  end

  describe "filtering" do
    let!(:shoe1) { create(:shoe) }
    let!(:shoe2) { create(:shoe) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: shoe2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([shoe2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:shoe1) { create(:shoe) }
      let!(:shoe2) { create(:shoe) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      shoe1.id,
                                      shoe2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      shoe2.id,
                                      shoe1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
