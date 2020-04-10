class InstitutesSerializer < ApplicationSerializer

  class << self

    def serialize(institutes, current_page, per_page, total_institutes)
      {
        current_page: current_page,
        per_page: per_page,
        total_entries: total_institutes,
        entries: institutes.map(&method(:format_institute))
      }
    end

    private

    def format_institute(institute)
      {
        id: institute.id,
        name: institute.name,
        address: institute.address,
        city: institute.city,
        phone: institute.phone,
        geocode: {
          lat: institute.latitude,
          long: institute.longitude
        }
      }
    end
  end
end
