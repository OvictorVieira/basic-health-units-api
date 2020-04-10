class BrazilianOpenDataPortal::Formatters::InstituteFormatter

  class << self

    include SpecialSymbolsCleaner

    def format(institutes)
      institutes.map do |institute|

        institute_properties = convert_items_to_single_hash(institute['properties'])

        institute_model(institute_properties)
      end
    end

    private

    def convert_items_to_single_hash(item)
      item.inject(&:merge)
    end

    def institute_model(institute)
      {
        name: institute['no_fantasia'],
        address: merge_address_with_number(institute),
        neighborhood: institute['no_bairro'],
        city: institute['cidade'],
        phone: remove_special_symbols_from(institute['nu_telefone']),
        latitude: institute['lat'],
        longitude: institute['long'],
      }
    end

    def merge_address_with_number(institute)
      "#{institute['no_logradouro']}, #{institute['nu_endereco']}"
    end
  end
end