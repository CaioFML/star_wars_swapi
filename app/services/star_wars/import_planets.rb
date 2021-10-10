module StarWars
  class ImportPlanets < Base
    def call
      (1..).each do |page|
        response = get_planets(page)

        break unless response.found?

        import_planets(response)
      end
    end

    private

    def get_planets(page)
      api.get_planets(page: page)
    end

    def import_planets(response)
      planets_attributes = []

      response.data.results.each do |result|
        planets_attributes << slice_attributes(result)
      end

      Planet.create!(planets_attributes)
    end

    def slice_attributes(result)
      result.to_h.slice(
        :name,
        :rotation_period,
        :orbital_period,
        :diameter,
        :climate,
        :gravity,
        :terrain,
        :surface_water,
        :population,
        :url
      )
    end
  end
end
