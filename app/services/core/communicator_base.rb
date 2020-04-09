# frozen_string_literal: true
class Core::CommunicatorBase

  class << self

    include Core::ResponseFormatter

    SUCCESS_CODE = '200'

    def get(url_base, endpoint)
      @response = HTTParty.get(mount_end_point(url_base, endpoint))

      response_analyser
    end

    private

    def mount_end_point(url_base, endpoint = '')
      url_base + endpoint
    end

    def response_analyser
      return request_failed(@response.code) unless succeeded?

      request_success(@response)
    end

    def succeeded?
      @response.code.to_s == SUCCESS_CODE
    end
  end
end
