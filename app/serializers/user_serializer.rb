class UserSerializer < ApplicationSerializer

  attributes :name, :email, :cnpj, :authentication_token
end
