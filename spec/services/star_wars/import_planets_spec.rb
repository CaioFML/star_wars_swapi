describe StarWars::ImportPlanets do
  describe "#call" do
    subject(:call) { described_class.call }

    before do
      allow(Swapi::Request).to receive(:new).and_return swapi_api
      allow(swapi_api).to receive(:get_planets).with(page: 1).once.and_return response
      allow(swapi_api).to receive(:get_planets).with(page: 2).once.and_return OpenStruct.new(found?: false)
    end

    let(:swapi_api) { instance_double(Swapi::Request) }
    let(:response) do
      OpenStruct.new(
        found?: true,
        data: OpenStruct.new(
          results: [
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
          ]
        )
      )
    end

    let(:response_attributes) do
      response.data.results.first.to_h.slice(
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

    it "changes planet count on database" do
      expect { call }.to change(Planet, :count).by 1
    end

    it "imports planet with the given attributes" do
      call

      expect(Planet.first).to have_attributes(response_attributes)
    end
  end
end
