require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe GetAllOperationInstitutes, type: :cron do

  context 'Enqueue worker for import ubs data from Brazilian open data portal' do

    it 'success when government API returns data' do

      VCR.use_cassette 'cron/success_and_feedback_with_data_ubs_from_brazilian_open_data_portal' do

        GetAllOperationInstitutes.fetch
      end

      InstituteCreatorWorker.jobs.each do |job|

        expect(job['class']).to eql InstituteCreatorWorker.to_s
        expect(job['args'].present?).to be_truthy
      end

      InstituteCreatorWorker.drain
    end

    it 'when dont government API returns data success' do

      VCR.use_cassette 'cron/success_and_feedback_without_data_ubs_from_brazilian_open_data_portal' do

        GetAllOperationInstitutes.fetch
      end

      expect(InstituteCreatorWorker.jobs.empty?).to be_truthy

      InstituteCreatorWorker.drain
    end
  end
end