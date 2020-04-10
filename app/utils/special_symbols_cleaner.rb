module SpecialSymbolsCleaner

  def remove_special_symbols_from(field)
    return field.gsub!(special_symbols_regex, '') if has_special_symbols?(field)

    field
  end

  private

  def has_special_symbols?(field)
    field.match special_symbols_regex
  end

  def special_symbols_regex
    /[^0-9A-Za-z]/
  end
end