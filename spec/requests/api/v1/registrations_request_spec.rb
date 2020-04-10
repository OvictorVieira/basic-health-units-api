require 'rails_helper'

RSpec.describe 'Api::V1::RegistrationsController', type: :request do

  describe 'POST /api/v1/sign_up' do

    it 'when the user is able to register successfully' do
      post api_v1_sign_up_path, headers: {
                                  'ACCEPT': 'application/json'
                                },
                                params: {
                                  'user': {
                                    'name': Faker::Name.name,
                                    'email': 'user@gmail.com',
                                    'cnpj': rand.to_s[2..15],
                                    'password': 'password',
                                    'password_confirmation': 'password',
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

    it 'when the user tries to register with a CNPJ already existing in the database' do

      user = FactoryBot.create(:user, name: Faker::Name.name, email: "leonardo_@gmail.com", cnpj: '99887766554433')

      post api_v1_sign_up_path, headers: {
                                  'ACCEPT': 'application/json'
                                },
                                params: {
                                  'user': {
                                    'name': Faker::Name.name,
                                    'email': 'user@gmail.com',
                                    'cnpj': user.cnpj,
                                    'password': 'password',
                                    'password_confirmation': 'password',
                                  }
                                }

      response_body = JSONHelper.json_parser(response.body)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body['message']).to eql I18n.t('users.errors.messages.cnpj_already_exists')
    end
  end
end