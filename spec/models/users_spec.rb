require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations tests' do

    let(:user) { FactoryBot.create(:user, name: Faker::Name.name, email: 'user@gmail.com') }

    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without a name" do
      user.name = nil

      expect(user).to_not be_valid
    end

    it "is not valid without a email" do
      user.email = nil

      expect(user).to_not be_valid
    end

    it "is not valid without a cnpj" do
      user.cnpj = nil

      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user.password = nil

      expect(user).to_not be_valid
    end
  end
end