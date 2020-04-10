class Api::V1::SessionsController < Devise::SessionsController

  protect_from_forgery unless: -> { request.format.json? }

  acts_as_token_authentication_handler_for User, except: [:login]

  def login
    @user = User.find_by_email(params['user']['email'])

    if @user&.valid_password?(params['user']['password'])

      sign_in @user

      render json: @user, status: :ok
    else
      render json: { message: I18n.t('devise.failure.not_found_in_database', authentication_keys: 'E-mail') },
             status: :unauthorized
    end
  end

  def logout
    unless all_signed_out?
      current_user.authentication_token = nil

      current_user.save!
    end

    render json: { message: I18n.t('devise.sessions.signed_out') },
           status: :ok
  end

end
