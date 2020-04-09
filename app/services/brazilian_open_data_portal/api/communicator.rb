# frozen_string_literal: true
class BrazilianOpenDataPortal::Api::Communicator

  URL_BASE = 'http://i3geo.saude.gov.br/'

  def initialize(communication_base)
    @communication = communication_base
  end

  def get(feature_type)
    request = @communication.get(URL_BASE, mount_endpoint(feature_type))

    raise BrazilianOpenDataPortal::Errors::UnavailableServiceError unless request[:success]

    request[:response]
  end

  private

  def mount_endpoint(feature_type)
    "i3geo/ogc.php?service=WFS&version=1.0.0&request=GetFeature&typeName=#{feature_type}&outputFormat=JSON"
  end

end
