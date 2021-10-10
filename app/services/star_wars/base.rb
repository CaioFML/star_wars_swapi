module StarWars
  class Base < ApplicationService
    private

    def api
      @api ||= Swapi::Request.new
    end
  end
end
