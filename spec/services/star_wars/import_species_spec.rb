describe StarWars::ImportSpecies do
  describe "#call" do
    subject(:call) { described_class.call }

    before do
      allow(StarWarsAPI::Swapi::Request).to receive(:new).and_return swapi_api
      allow(swapi_api).to receive(:get_species).with(page: 1).once.and_return response
      allow(swapi_api).to receive(:get_species).with(page: 2).once.and_return OpenStruct.new(found?: false)
    end

    let(:swapi_api) { instance_double(StarWarsAPI::Swapi::Request) }
    let(:response) do
      OpenStruct.new(
        found?: true,
        data: OpenStruct.new(
          results: [
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
          ]
        )
      )
    end

    let(:response_attributes) do
      response.data.results.first.to_h.slice(
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

    it "changes species count on database" do
      expect { call }.to change(Specie, :count).by 1
    end

    it "imports species with the given attributes" do
      call

      expect(Specie.first).to have_attributes(response_attributes)
    end
  end
end
