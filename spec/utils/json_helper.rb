class JSONHelper

  class << self

    def json_loader(file_path)
      IO.read(file_path)
    end

    def json_parser(file_path_or_object)
      JSON.parse(file_path_or_object)
    end
  end
end
