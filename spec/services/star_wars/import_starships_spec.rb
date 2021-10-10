describe StarWars::ImportStarships do
  describe "#call" do
    subject(:call) { described_class.call }

    before do
      allow(Swapi::Request).to receive(:new).and_return swapi_api
      allow(swapi_api).to receive(:get_starships).with(page: 1).once.and_return response
      allow(swapi_api).to receive(:get_starships).with(page: 2).once.and_return OpenStruct.new(found?: false)
    end

    let(:swapi_api) { instance_double(Swapi::Request) }
    let(:response) do
      OpenStruct.new(
        found?: true,
        data: OpenStruct.new(
          results: [
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
          ]
        )
      )
    end

    let(:response_attributes) do
      response.data.results.first.to_h.slice(
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

    it "changes starship count on database" do
      expect { call }.to change(Starship, :count).by 1
    end

    it "imports starship with the given attributes" do
      call

      expect(Starship.first).to have_attributes(response_attributes)
    end
  end
end
