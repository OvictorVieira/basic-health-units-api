class Api::V1::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery unless: -> { request.format.json? }

  respond_to :json
end