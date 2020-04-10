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
        phone: phone(institute),
        geocode: {
          lat: institute.latitude,
          long: institute.longitude
        }
      }
    end

    def phone(institute)
      institute.phone || I18n.t('institutes.fields.field_not_informed')
    end
  end
end
