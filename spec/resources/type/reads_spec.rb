require "rails_helper"

RSpec.describe TypeResource, type: :resource do
  describe "serialization" do
    let!(:type) { create(:type) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(type.id)
      expect(data.jsonapi_type).to eq("types")
    end
  end

  describe "filtering" do
    let!(:type1) { create(:type) }
    let!(:type2) { create(:type) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: type2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([type2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:type1) { create(:type) }
      let!(:type2) { create(:type) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      type1.id,
                                      type2.id,
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
                                      type2.id,
                                      type1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
