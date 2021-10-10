module StarWars
  class ImportSpecies < Base
    def call
      (1..).each do |page|
        response = get_species(page)

        break unless response.found?

        import_species(response)
      end
    end

    private

    def get_species(page)
      api.get_species(page: page)
    end

    def import_species(response)
      species_attributes = []

      response.data.results.each do |result|
        species_attributes << slice_attributes(result)
        Specie.create!(species_attributes)
      end
    end

    def slice_attributes(result)
      result.to_h.slice(
        :name,
        :classification,
        :designation,
        :average_height,
        :skin_colors,
        :hair_colors,
        :eye_colors,
        :average_lifespan,
        :language,
        :url
      )
    end
  end
end
