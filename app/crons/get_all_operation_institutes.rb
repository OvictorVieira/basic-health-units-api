class GetAllOperationInstitutes

  class << self

    include InstituteCreationPolicy

    def fetch
      brazilian_portal_communicator = BrazilianOpenDataPortal::Api::Communicator.new(Core::CommunicatorBase)

      ubs_type_feature_in_operation = BrazilianOpenDataPortal::Features::UbsInOperation::FEATURE_TYPE

      response = brazilian_portal_communicator.get(ubs_type_feature_in_operation)

      institutes_on_brazilian_portal = response['features']

      return if institutes_on_brazilian_portal.blank?

      institute_formatter = BrazilianOpenDataPortal::Formatters::InstituteFormatter

      formatted_institutes = institute_formatter.format(institutes_on_brazilian_portal)

      enqueue_creation_of_institute(formatted_institutes)
    end

    private

    def enqueue_creation_of_institute(institutes)

      institutes.map do |institute|

        InstituteCreatorWorker
            .perform_in(set_random_interval, institute) unless institute_already_exists?(institute)
      end
    end

    def set_random_interval
      ten_minutes_interval = rand(0..60*10)

      ten_minutes_interval.seconds
    end
  end
end