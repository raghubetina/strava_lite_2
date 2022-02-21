require "rails_helper"

RSpec.describe Activity, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:type) }

    it { should belong_to(:shoes) }

    it { should belong_to(:owner) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
