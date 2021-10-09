describe Swapi::Request do
  let(:page) { 1 }

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

    context "with success response" do
      it "gets people" do
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

      it "gets people" do
        VCR.use_cassette("swapi_get_people_page_2", match_requests_on: %i[method uri body]) do
          expect(get_people).to have_attributes(response)
        end
      end
    end

    include_examples "not found data", "swapi_get_people_not_found"
  end
end
