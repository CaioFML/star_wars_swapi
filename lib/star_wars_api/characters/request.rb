module StarWarsAPI
  module Characters
    class Request
      STAR_WARS_URI = "https://rawcdn.githack.com/akabab/starwars-api/0.2.1/api/all.json"

      def get_people
        @response = HTTParty.get(STAR_WARS_URI)

        parse_response
      end

      private

      attr_reader :response

      def parse_response
        OpenStruct.new(
          found?: response.success?,
          data: json_to_object
        )
      end

      def json_to_object
        JSON.parse(response.body, symbolize_names: true, object_class: OpenStruct)
      end
    end
  end
end
