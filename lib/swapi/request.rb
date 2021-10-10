module Swapi
  class Request
    SWAPI_URI = "https://swapi.dev/api/".freeze

    def get_people(page: 1)
      request(:get, "people/?page=#{page}")
    end

    def get_planets(page: 1)
      request(:get, "planets/?page=#{page}")
    end

    def get_species(page: 1)
      request(:get, "species/?page=#{page}")
    end

    def get_starships(page: 1)
      request(:get, "starships/?page=#{page}")
    end

    private

    attr_reader :response

    def request(method, path)
      @response = HTTParty.send(method, uri(path))

      parse_response
    end

    def parse_response
      OpenStruct.new(
        found?: response.success?,
        data: json_to_object
      )
    end

    def json_to_object
      JSON.parse(response.body, symbolize_names: true, object_class: OpenStruct)
    end

    def uri(path)
      URI.join(SWAPI_URI, path).to_s
    end
  end
end
