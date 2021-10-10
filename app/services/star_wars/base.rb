module StarWars
  class Base < ApplicationService
    private

    def api
      @api ||= StarWarsAPI::Swapi::Request.new
    end
  end
end
