class Api::V1::UserRegistrationsController < Devise::RegistrationsController

  include UserRegistrationPolicy
  include SpecialSymbolsCleaner

  before_action :validates_if_cnpj_already_exists, only: [:create]

  protect_from_forgery unless: -> { request.format.json? }
  respond_to :json

  def validates_if_cnpj_already_exists
    remove_special_symbols_from_cnpj

    if cnpj_already_exists?(params['user']['cnpj'])

      render json: { message: I18n.t('users.errors.messages.cnpj_already_exists') },
             status: :unprocessable_entity
    end
  end

  private

  def remove_special_symbols_from_cnpj
    params['user']['cnpj'] = remove_special_symbols_from(params['user']['cnpj'])
  end
end