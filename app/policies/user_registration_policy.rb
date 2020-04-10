module UserRegistrationPolicy

  def cnpj_already_exists?(cnpj)
    user = User.find_by_cnpj(cnpj)

    user.present?
  end
end