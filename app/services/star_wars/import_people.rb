module StarWars
  class ImportPeople < Base
    def call
      (1..).each do |page|
        response = get_people(page)

        break unless response.found?

        import_people(response)
      end
    end

    private

    def get_people(page)
      api.get_people(page: page)
    end

    def import_people(response)
      people_attributes = []

      response.data.results.each do |result|
        people_attributes << person_attribute(result)
      end

      Person.create!(people_attributes)
    end

    def person_attribute(result)
      [
        slice_attributes(result),
        find_homeworld_association(result),
        find_starship_associations(result),
        find_species_associations(result)
      ].inject(&:merge)
    end

    def slice_attributes(result)
      result.to_h.slice(
        :name,
        :height,
        :mass,
        :hair_color,
        :skin_color,
        :eye_color,
        :birth_year,
        :gender,
        :url
      )
    end

    def find_homeworld_association(result)
      { homeworld: Planet.find_by(url: result.homeworld) }
    end

    def find_starship_associations(result)
      starships = result.starships.map do |starship|
        Starship.find_by(url: starship)
      end

      { starships: starships.compact }
    end

    def find_species_associations(result)
      species = result.species.map do |specie|
        Specie.find_by(url: specie)
      end

      { species: species.compact }
    end
  end
end
