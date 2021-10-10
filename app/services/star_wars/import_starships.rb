module StarWars
  class ImportStarships < Base
    def call
      (1..).each do |page|
        response = get_starships(page)

        break unless response.found?

        import_starships(response)
      end
    end

    private

    def get_starships(page)
      api.get_starships(page: page)
    end

    def import_starships(response)
      starships_attributes = []

      response.data.results.each do |result|
        starships_attributes << slice_attributes(result)
        Starship.create!(starships_attributes)
      end
    end

    def slice_attributes(result)
      result.to_h.slice(
        :name,
        :model,
        :manufacturer,
        :cost_in_credits,
        :length,
        :max_atmosphering_speed,
        :crew,
        :passengers,
        :cargo_capacity,
        :consumables,
        :hyperdrive_rating,
        :mglt,
        :starship_class,
        :url
      )
    end
  end
end
