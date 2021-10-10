describe StarWars::ImportPeople do
  describe "#call" do
    subject(:call) { described_class.call }

    before do
      allow(Swapi::Request).to receive(:new).and_return swapi_api
      allow(swapi_api).to receive(:get_people).with(page: 1).once.and_return response
      allow(swapi_api).to receive(:get_people).with(page: 2).once.and_return OpenStruct.new(found?: false)
    end

    let(:swapi_api) { instance_double(Swapi::Request) }
    let(:person) { Person.first }
    let(:response) do
      OpenStruct.new(
        found?: true,
        data: OpenStruct.new(
          results: [
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
              species: ["https://swapi.dev/api/species/1/"],
              vehicles: %w[https://swapi.dev/api/vehicles/14/ https://swapi.dev/api/vehicles/30/],
              starships: %w[https://swapi.dev/api/starships/12/ https://swapi.dev/api/starships/22/],
              created: "2014-12-09T13:50:51.644000Z",
              edited: "2014-12-20T21:17:56.891000Z",
              url: "https://swapi.dev/api/people/1/"
            )
          ]
        )
      )
    end

    let(:response_attributes) do
      response.data.results.first.to_h.slice(
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

    let!(:planet) do
      create(:planet, url: "https://swapi.dev/api/planets/1/")
    end

    let!(:species) do
      [create(:specie, url: "https://swapi.dev/api/species/1/")]
    end

    let!(:starships) do
      [
        create(:starship, url: "https://swapi.dev/api/starships/12/"),
        create(:starship, url: "https://swapi.dev/api/starships/22/")
      ]
    end

    it "changes person count on database" do
      expect { call }.to change(Person, :count).by 1
    end

    it "imports person with the given attributes" do
      call

      expect(person).to have_attributes(response_attributes)
    end

    it "imports person with planet association" do
      call

      expect(person.homeworld).to eq planet
    end

    it "imports person with starships association" do
      call

      expect(person.starships).to eq starships
    end

    it "imports person with species association" do
      call

      expect(person.species).to eq species
    end
  end
end
