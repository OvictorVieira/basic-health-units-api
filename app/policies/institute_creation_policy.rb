module InstituteCreationPolicy

  def institute_already_exists?(new_institute)
    institute = Institute.find_by_latitude_and_longitude(new_institute[:latitude], new_institute[:longitude])

    institute.present?
  end
end