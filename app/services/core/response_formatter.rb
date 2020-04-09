module Core::ResponseFormatter

  def request_success(response = {})
    {
      success: true,
      response: response
    }
  end

  def request_failed(response_code)
    {
      success: false,
      status_code: response_code
    }
  end
end
