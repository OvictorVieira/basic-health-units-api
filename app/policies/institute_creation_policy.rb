module InstituteCreationPolicy

  def institute_already_exists?(new_institute)
    institute = Institute.find_by(name: new_institute['name'],
                                  address: new_institute['address'],
                                  neighborhood: new_institute['neighborhood'],
                                  city: new_institute['city'],
                                  phone: new_institute['phone'])

    institute.present?
  end
end