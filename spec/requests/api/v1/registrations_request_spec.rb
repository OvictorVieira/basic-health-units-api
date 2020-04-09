require 'rails_helper'

RSpec.describe 'Api::V1::RegistrationsController', type: :request do

  describe 'POST /api/users/sign_up' do

    it 'returns success' do
      post api_v1_sign_up_path, params: {
        'user' => {
          'name' => Faker::Name.name,
          'email' => 'user@gmail.com',
          'cnpj' => rand.to_s[2..15],
          'password' => 'password',
          'password_confirmation' => 'password',
        }
      }

      response_body = JSONHelper.json_parser(response.body)

      expect(response).to be_successful
      expect(response.content_type).to eql('application/json; charset=utf-8')

      expect(response_body['name']).to be_present
      expect(response_body['email']).to be_present
      expect(response_body['cnpj']).to be_present
      expect(response_body['authentication_token']).to be_present
    end
  end
end