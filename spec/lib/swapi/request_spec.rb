describe Swapi::Request do
  shared_examples "not found data" do |cassette_name|
    context "when not found data" do
      let(:page) { 25 }

      it "returns not found object" do
        VCR.use_cassette(cassette_name, match_requests_on: %i[method uri body]) do
          expect(subject).to eq OpenStruct.new(found?: false, data: OpenStruct.new(detail: "Not found"))
        end
      end
    end
  end

  describe "#get_people" do
    subject(:get_people) { described_class.new.get_people(page: page) }

    context "without page param" do
      subject(:get_people) { described_class.new.get_people }

      let(:response) do
        {
          class: OpenStruct,
          found?: true,
          data: have_attributes(
            class: OpenStruct,
            count: 82,
            next: "https://swapi.dev/api/people/?page=2",
            previous: nil,
            results: include(
              OpenStruct.new(
                name: "Luke Skywalker",
                height: "172",
                mass: "77",
                hair_color: "blond",
                skin_color: "fair",
                eye_color: "blue",
                birth_year: "19BBY",
                gender: "male",
                homeworld: "https://swapi.dev/api/planets/1/",
                films: %w[
                  https://swapi.dev/api/films/1/
                  https://swapi.dev/api/films/2/
                  https://swapi.dev/api/films/3/
                  https://swapi.dev/api/films/6/
                ],
                species: [],
                vehicles: %w[https://swapi.dev/api/vehicles/14/ https://swapi.dev/api/vehicles/30/],
                starships: %w[https://swapi.dev/api/starships/12/ https://swapi.dev/api/starships/22/],
                created: "2014-12-09T13:50:51.644000Z",
                edited: "2014-12-20T21:17:56.891000Z",
                url: "https://swapi.dev/api/people/1/"
              )
            )
          )
        }
      end

      it "returns list of people" do
        VCR.use_cassette("swapi_get_people", match_requests_on: %i[method uri body]) do
          expect(get_people).to have_attributes(response)
        end
      end
    end

    context "with page param" do
      let(:page) { 2 }

      let(:response) do
        {
          class: OpenStruct,
          found?: true,
          data: have_attributes(
            class: OpenStruct,
            count: 82,
            next: "https://swapi.dev/api/people/?page=3",
            previous: "https://swapi.dev/api/people/?page=1",
            results: include(
              OpenStruct.new(
                name: "Anakin Skywalker",
                height: "188",
                mass: "84",
                hair_color: "blond",
                skin_color: "fair",
                eye_color: "blue",
                birth_year: "41.9BBY",
                gender: "male",
                homeworld: "https://swapi.dev/api/planets/1/",
                films: %w[https://swapi.dev/api/films/4/ https://swapi.dev/api/films/5/ https://swapi.dev/api/films/6/],
                species: [],
                vehicles: %w[https://swapi.dev/api/vehicles/44/ https://swapi.dev/api/vehicles/46/],
                starships: %w[
                  https://swapi.dev/api/starships/39/
                  https://swapi.dev/api/starships/59/
                  https://swapi.dev/api/starships/65/
                ],
                created: "2014-12-10T16:20:44.310000Z",
                edited: "2014-12-20T21:17:50.327000Z",
                url: "https://swapi.dev/api/people/11/"
              )
            )
          )
        }
      end

      it "returns list of people" do
        VCR.use_cassette("swapi_get_people_page_2", match_requests_on: %i[method uri body]) do
          expect(get_people).to have_attributes(response)
        end
      end
    end

    include_examples "not found data", "swapi_get_people_not_found"
  end

  describe "#get_planets" do
    subject(:get_planets) { described_class.new.get_planets(page: page) }

    context "without page param" do
      subject(:get_planets) { described_class.new.get_planets }

      let(:response) do
        {
          class: OpenStruct,
          found?: true,
          data: have_attributes(
            class: OpenStruct,
            count: 60,
            next: "https://swapi.dev/api/planets/?page=2",
            previous: nil,
            results: include(
              OpenStruct.new(
                name: "Tatooine",
                rotation_period: "23",
                orbital_period: "304",
                diameter: "10465",
                climate: "arid",
                gravity: "1 standard",
                terrain: "desert",
                surface_water: "1",
                population: "200000",
                residents: %w[
                  https://swapi.dev/api/people/1/
                  https://swapi.dev/api/people/2/
                  https://swapi.dev/api/people/4/
                  https://swapi.dev/api/people/6/
                  https://swapi.dev/api/people/7/
                  https://swapi.dev/api/people/8/
                  https://swapi.dev/api/people/9/
                  https://swapi.dev/api/people/11/
                  https://swapi.dev/api/people/43/
                  https://swapi.dev/api/people/62/
                ],
                films: %w[
                  https://swapi.dev/api/films/1/
                  https://swapi.dev/api/films/3/
                  https://swapi.dev/api/films/4/
                  https://swapi.dev/api/films/5/
                  https://swapi.dev/api/films/6/
                ],
                created: "2014-12-09T13:50:49.641000Z",
                edited: "2014-12-20T20:58:18.411000Z",
                url: "https://swapi.dev/api/planets/1/"
              )
            )
          )
        }
      end

      it "returns list of planets" do
        VCR.use_cassette("swapi_get_planets", match_requests_on: %i[method uri body]) do
          expect(get_planets).to have_attributes(response)
        end
      end
    end

    context "with page param" do
      let(:page) { 2 }

      let(:response) do
        {
          class: OpenStruct,
          found?: true,
          data: have_attributes(
            class: OpenStruct,
            count: 60,
            next: "https://swapi.dev/api/planets/?page=3",
            previous: "https://swapi.dev/api/planets/?page=1",
            results: include(
              OpenStruct.new(
                name: "Geonosis",
                rotation_period: "30",
                orbital_period: "256",
                diameter: "11370",
                climate: "temperate, arid",
                gravity: "0.9 standard",
                terrain: "rock, desert, mountain, barren",
                surface_water: "5",
                population: "100000000000",
                residents: [
                  "https://swapi.dev/api/people/63/"
                ],
                films: [
                  "https://swapi.dev/api/films/5/"
                ],
                created: "2014-12-10T12:47:22.350000Z",
                edited: "2014-12-20T20:58:18.437000Z",
                url: "https://swapi.dev/api/planets/11/"
              )
            )
          )
        }
      end

      it "returns list of planets" do
        VCR.use_cassette("swapi_get_planets_page_2", match_requests_on: %i[method uri body]) do
          expect(get_planets).to have_attributes(response)
        end
      end
    end

    include_examples "not found data", "swapi_get_planets_not_found"
  end

  describe "#get_species" do
    subject(:get_species) { described_class.new.get_species(page: page) }

    context "without page param" do
      subject(:get_species) { described_class.new.get_species }

      let(:response) do
        {
          class: OpenStruct,
          found?: true,
          data: have_attributes(
            class: OpenStruct,
            count: 37,
            next: "https://swapi.dev/api/species/?page=2",
            previous: nil,
            results: include(
              OpenStruct.new(
                name: "Human",
                classification: "mammal",
                designation: "sentient",
                average_height: "180",
                skin_colors: "caucasian, black, asian, hispanic",
                hair_colors: "blonde, brown, black, red",
                eye_colors: "brown, blue, green, hazel, grey, amber",
                average_lifespan: "120",
                homeworld: "https://swapi.dev/api/planets/9/",
                language: "Galactic Basic",
                people: %w[
                  https://swapi.dev/api/people/66/
                  https://swapi.dev/api/people/67/
                  https://swapi.dev/api/people/68/
                  https://swapi.dev/api/people/74/
                ],
                films: %w[
                  https://swapi.dev/api/films/1/
                  https://swapi.dev/api/films/2/
                  https://swapi.dev/api/films/3/
                  https://swapi.dev/api/films/4/
                  https://swapi.dev/api/films/5/
                  https://swapi.dev/api/films/6/
                ],
                created: "2014-12-10T13:52:11.567000Z",
                edited: "2014-12-20T21:36:42.136000Z",
                url: "https://swapi.dev/api/species/1/"
              )
            )
          )
        }
      end

      it "returns list of species" do
        VCR.use_cassette("swapi_get_species", match_requests_on: %i[method uri body]) do
          expect(get_species).to have_attributes(response)
        end
      end
    end

    context "with page param" do
      let(:page) { 2 }

      let(:response) do
        {
          class: OpenStruct,
          found?: true,
          data: have_attributes(
            class: OpenStruct,
            count: 37,
            next: "https://swapi.dev/api/species/?page=3",
            previous: "https://swapi.dev/api/species/?page=1",
            results: include(
              OpenStruct.new(
                name: "Neimodian",
                classification: "unknown",
                designation: "sentient",
                average_height: "180",
                skin_colors: "grey, green",
                hair_colors: "none",
                eye_colors: "red, pink",
                average_lifespan: "unknown",
                homeworld: "https://swapi.dev/api/planets/18/",
                language: "Neimoidia",
                people: [
                  "https://swapi.dev/api/people/33/"
                ],
                films: [
                  "https://swapi.dev/api/films/4/"
                ],
                created: "2014-12-19T17:07:31.319000Z",
                edited: "2014-12-20T21:36:42.160000Z",
                url: "https://swapi.dev/api/species/11/"
              )
            )
          )
        }
      end

      it "returns list of species" do
        VCR.use_cassette("swapi_get_species_with_page", match_requests_on: %i[method uri body]) do
          expect(get_species).to have_attributes(response)
        end
      end
    end

    include_examples "not found data", "swapi_get_species_not_found"
  end

  describe "get_starships" do
    subject(:get_starships) { described_class.new.get_starships(page: page) }

    context "without page param" do
      subject(:get_starships) { described_class.new.get_starships }

      let(:response) do
        {
          class: OpenStruct,
          found?: true,
          data: have_attributes(
            class: OpenStruct,
            count: 36,
            next: "https://swapi.dev/api/starships/?page=2",
            previous: nil,
            results: include(
              OpenStruct.new(
                name: "CR90 corvette",
                model: "CR90 corvette",
                manufacturer: "Corellian Engineering Corporation",
                cost_in_credits: "3500000",
                length: "150",
                max_atmosphering_speed: "950",
                crew: "30-165",
                passengers: "600",
                cargo_capacity: "3000000",
                consumables: "1 year",
                hyperdrive_rating: "2.0",
                MGLT: "60",
                starship_class: "corvette",
                pilots: [],
                films: %w[
                  https://swapi.dev/api/films/1/
                  https://swapi.dev/api/films/3/
                  https://swapi.dev/api/films/6/
                ],
                created: "2014-12-10T14:20:33.369000Z",
                edited: "2014-12-20T21:23:49.867000Z",
                url: "https://swapi.dev/api/starships/2/"
              )
            )
          )
        }
      end

      it "returns list of starships" do
        VCR.use_cassette("swapi_get_starships", match_requests_on: %i[method uri body]) do
          expect(get_starships).to have_attributes(response)
        end
      end
    end

    context "with page param" do
      let(:page) { 2 }

      let(:response) do
        {
          class: OpenStruct,
          found?: true,
          data: have_attributes(
            class: OpenStruct,
            count: 36,
            next: "https://swapi.dev/api/starships/?page=3",
            previous: "https://swapi.dev/api/starships/?page=1",
            results: include(
              OpenStruct.new(
                name: "Slave 1",
                model: "Firespray-31-class patrol and attack",
                manufacturer: "Kuat Systems Engineering",
                cost_in_credits: "unknown",
                length: "21.5",
                max_atmosphering_speed: "1000",
                crew: "1",
                passengers: "6",
                cargo_capacity: "70000",
                consumables: "1 month",
                hyperdrive_rating: "3.0",
                MGLT: "70",
                starship_class: "Patrol craft",
                pilots: ["https://swapi.dev/api/people/22/"],
                films: %w[https://swapi.dev/api/films/2/ https://swapi.dev/api/films/5/],
                created: "2014-12-15T13:00:56.332000Z",
                edited: "2014-12-20T21:23:49.897000Z",
                url: "https://swapi.dev/api/starships/21/"
              )
            )
          )
        }
      end

      it "returns list of starships" do
        VCR.use_cassette("swapi_get_starships_with_page", match_requests_on: %i[method uri body]) do
          expect(get_starships).to have_attributes(response)
        end
      end
    end

    include_examples "not found data", "swapi_get_starships_not_found"
  end
end
