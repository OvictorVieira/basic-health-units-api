require 'rails_helper'

RSpec.describe Institute, type: :model do
  context 'validations tests' do
    let(:institute) { create(:institute, phone: 1122334433) }

    it "is valid with valid attributes" do
      expect(institute).to be_valid
    end

    it "is not valid without a name" do
      institute.name = nil

      expect(institute).to_not be_valid
    end

    it "is not valid without a address" do
      institute.address = nil

      expect(institute).to_not be_valid
    end

    it "is not valid without a city" do
      institute.city = nil

      expect(institute).to_not be_valid
    end

    it "is not valid without a phone" do
      institute.phone = nil

      expect(institute).to_not be_valid
    end

    it "is not valid without a latitude" do
      institute.lat = nil

      expect(institute).to_not be_valid
    end

    it "is not valid without a longitude" do
      institute.long = nil

      expect(institute).to_not be_valid
    end
  end

end
