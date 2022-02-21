require "rails_helper"

RSpec.describe ShoeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "shoes",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ShoeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Shoe.count }.by(1)
    end
  end

  describe "updating" do
    let!(:shoe) { create(:shoe) }

    let(:payload) do
      {
        data: {
          id: shoe.id.to_s,
          type: "shoes",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ShoeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { shoe.reload.updated_at }
      # .and change { shoe.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:shoe) { create(:shoe) }

    let(:instance) do
      ShoeResource.find(id: shoe.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Shoe.count }.by(-1)
    end
  end
end
