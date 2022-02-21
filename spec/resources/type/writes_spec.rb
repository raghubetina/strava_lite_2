require "rails_helper"

RSpec.describe TypeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "types",
          attributes: {},
        },
      }
    end

    let(:instance) do
      TypeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Type.count }.by(1)
    end
  end

  describe "updating" do
    let!(:type) { create(:type) }

    let(:payload) do
      {
        data: {
          id: type.id.to_s,
          type: "types",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      TypeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { type.reload.updated_at }
      # .and change { type.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:type) { create(:type) }

    let(:instance) do
      TypeResource.find(id: type.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Type.count }.by(-1)
    end
  end
end
