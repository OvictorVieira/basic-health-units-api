module InstituteCreationPolicy

  def institute_already_exists?(new_institute)
    institute = Institute.where(latitude: new_institute['latitude'], longitude: new_institute['longitude'])

    institute.present?
  end
end