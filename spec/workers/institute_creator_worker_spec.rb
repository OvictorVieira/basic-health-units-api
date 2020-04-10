require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe InstituteCreatorWorker, type: :worker do

  context 'Import ubs data from Brazilian open data portal' do

    it 'success when create ubs institute' do

      VCR.use_cassette 'cron/success_and_feedback_with_data_ubs_from_brazilian_open_data_portal' do

        GetAllOperationInstitutes.fetch
      end

      InstituteCreatorWorker.jobs.each do |job|

        InstituteCreatorWorker.new.perform(job['args'].first)

        created_institute = Institute.find_by_latitude_and_longitude(job['args'].first['latitude'],
                                                                     job['args'].first['longitude'])

        expect(created_institute.present?).to be_truthy
      end

      InstituteCreatorWorker.drain
    end
  end
end