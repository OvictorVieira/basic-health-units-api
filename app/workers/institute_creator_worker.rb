class InstituteCreatorWorker

  include Sidekiq::Worker
  include InstituteCreationPolicy

  sidekiq_options retry: 3, backtrace: true

  def perform(institute = {})
    Institute.create!(institute) unless institute_already_exists?(institute)
  end
end