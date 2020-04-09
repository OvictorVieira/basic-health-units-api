class Api::V1::SessionsController < Devise::SessionsController

  acts_as_token_authentication_handler_for User, except: [:login]

  skip_before_action :verify_authenticity_token, only: [:login]

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
    current_user.authentication_token = nil

    current_user.save!

    render json: { message: I18n.t('devise.sessions.signed_out') },
           status: :ok
  end

end
