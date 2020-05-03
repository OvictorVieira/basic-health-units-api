class InstituteCreatorWorker

  include Sidekiq::Worker

  sidekiq_options retry: 3, backtrace: true

  def perform(institute = {})
    Institute.create!(institute)
  end
end