require 'rails_helper'

RSpec.describe 'Api::V1::InstitutesController', type: :request do

  describe 'GET /api/v1/find_ubs' do

    context 'success' do

      let(:user) { FactoryBot.create(:user, name: Faker::Name.name,
                                     email: 'user@gmail.com') }

      it 'when passes only query as a parameter and returns 10 near ubs' do

        number_of_stub_created = 30

        create_fifteen_near_ubs = -> {
          (0..14).each do |i|
            Institute.create(name: "Ubs-#{i}", address: "Address-#{i}",
                             city: "City-#{i}", neighborhood: "neighborhood-#{i}",
                             phone: "1#{i}9876543212", latitude: "-23.5785#{i}59",
                             longitude: "-46.71004#{i}7")
          end
        }

        create_fifteen_distant_ubs = -> {
          (0..14).each do |i|
            Institute.create(name: "Ubs-#{i}", address: "Address-#{i}",
                             city: "City-#{i}", neighborhood: "neighborhood-#{i}",
                             phone: "1#{i}9876543212", latitude: "-23.#{i}785859",
                             longitude: "-46.#{i}100487")
          end
        }

        create_fifteen_near_ubs.call
        create_fifteen_distant_ubs.call

        get api_v1_find_ubs_path, headers: {
                                    'ACCEPT': 'application/json',
                                    'X-User-Email': user.email,
                                    'X-User-Token': user.authentication_token
                                  },
                                  params: {
                                    'query': '-23.604936,-46.692999'
                                  }

        response_body = JSONHelper.json_parser(response.body)

        expect(response).to be_successful
        expect(response.content_type).to eql('application/json; charset=utf-8')

        expect(response_body['current_page']).to eql Api::V1::InstitutesController::INITIAL_PAGE
        expect(response_body['per_page']).to eql Api::V1::InstitutesController::DEFAULT_ITEMS_PER_PAGE
        expect(response_body['total_entries']).to eql number_of_stub_created
        expect(response_body['entries']).to be_present
        expect(response_body['entries'].count).to eql Api::V1::InstitutesController::DEFAULT_ITEMS_PER_PAGE
      end

      it 'when passes query, page and per_page params and return per_page quantity near ubs' do

        number_of_stub_created = 30

        create_fifteen_near_ubs = -> {
          (0..14).each do |i|
            Institute.create(name: "Ubs-#{i}", address: "Address-#{i}",
                             city: "City-#{i}", neighborhood: "neighborhood-#{i}",
                             phone: "1#{i}9876543212", latitude: "-23.5785#{i}59",
                             longitude: "-46.71004#{i}7")
          end
        }

        create_fifteen_distant_ubs = -> {
          (0..14).each do |i|
            Institute.create(name: "Ubs-#{i}", address: "Address-#{i}",
                             city: "City-#{i}", neighborhood: "neighborhood-#{i}",
                             phone: "1#{i}9876543212", latitude: "-23.#{i}785859",
                             longitude: "-46.#{i}100487")
          end
        }

        create_fifteen_near_ubs.call
        create_fifteen_distant_ubs.call

        current_page = '2'
        per_page_value = '3'

        get api_v1_find_ubs_path, headers: {
                                    'ACCEPT': 'application/json',
                                    'X-User-Email': user.email,
                                    'X-User-Token': user.authentication_token
                                  },
                                  params: {
                                    'query': '-23.604936,-46.692999',
                                    'page': current_page,
                                    'per_page': per_page_value
                                  }

        response_body = JSONHelper.json_parser(response.body)

        expect(response).to be_successful
        expect(response.content_type).to eql('application/json; charset=utf-8')

        expect(response_body['current_page']).to eql current_page
        expect(response_body['per_page']).to eql per_page_value
        expect(response_body['total_entries']).to eql number_of_stub_created
        expect(response_body['entries']).to be_present
        expect(response_body['entries'].count.to_s).to eql per_page_value
      end

      it 'when there is no data in the database' do

        get api_v1_find_ubs_path, headers: {
                                    'ACCEPT': 'application/json',
                                    'X-User-Email': user.email,
                                    'X-User-Token': user.authentication_token
                                  },
                                  params: {
                                    'query': '-23.604936,-46.692999'
                                  }

        response_body = JSONHelper.json_parser(response.body)

        expect(response).to be_successful
        expect(response.content_type).to eql('application/json; charset=utf-8')

        expect(response_body['current_page']).to eql Api::V1::InstitutesController::INITIAL_PAGE
        expect(response_body['per_page']).to eql Api::V1::InstitutesController::DEFAULT_ITEMS_PER_PAGE
        expect(response_body['total_entries'].zero?).to be_truthy
        expect(response_body['entries'].empty?).to be_truthy
      end
    end
  end
end