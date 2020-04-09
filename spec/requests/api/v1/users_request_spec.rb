require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe 'GET /api/v1/login' do

    context 'when a user tries to login to the API' do

      let(:user) { FactoryBot.create(:user, name: Faker::Name.name, email: 'user@gmail.com') }

      it 'returns success' do
        post api_v1_login_path, headers: { 'ACCEPT': 'application/json' }, params: {
          'user' => {
            'email' => user.email,
            'password' => user.password
          }
        }

        response_body = JSONHelper.json_parser(response.body)

        expect(response).to be_successful
        expect(response.content_type).to eql('application/json; charset=utf-8')

        expect(response_body['name']).to be_present
        expect(response_body['email']).to be_present
        expect(response_body['authentication_token']).to be_present
      end

      it 'returns unauthorized when using invalid email' do
        post api_v1_login_path, headers: { 'ACCEPT': 'application/json' }, params: {
          'user' => {
            'email' => '__@gmail.com',
            'password' => user.password
          }
        }

        expect(response).to have_http_status(:unauthorized)
        expect(response.content_type).to eql('application/json; charset=utf-8')
      end

      it 'returns unauthorized when using invalid password' do
        post api_v1_login_path, headers: { 'ACCEPT': 'application/json' }, params: {
          'user' => {
            'email' => user.email,
            'password' => '0000'
          }
        }

        expect(response).to have_http_status(:unauthorized)
        expect(response.content_type).to eql('application/json; charset=utf-8')
      end
    end

    context 'when a user tries to logout to the API' do

      let(:user) { FactoryBot.create(:user, name: Faker::Name.name, email: "leonardo_@gmail.com") }

      it 'returns success' do
        current_authentication_token = user.authentication_token

        post api_v1_logout_path, headers: { 'ACCEPT': 'application/json',
                                            'X-User-Email': user.email,
                                            'X-User-Token': user.authentication_token }

        response_body = JSONHelper.json_parser(response.body)

        expect(response).to be_successful
        expect(response.content_type).to eql('application/json; charset=utf-8')

        expect(response_body['message']).to eql I18n.t('devise.sessions.signed_out')
        expect(user.authentication_token).not_to be eql current_authentication_token
      end
    end
  end
end
