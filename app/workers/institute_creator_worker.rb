class InstituteCreatorWorker

  include Sidekiq::Worker
  include InstituteCreationPolicy

  sidekiq_options retry: 3, backtrace: true

  def perform(institute = {})
    Institute.create(institute) unless should_create_institute?(institute)
  end
end