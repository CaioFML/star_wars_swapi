describe StarWars::ImportPeopleImages do
  describe "#call" do
    subject(:call) { described_class.call }

    before do
      allow(StarWarsAPI::Characters::Request).to receive(:new).and_return star_wars_characters_api
      allow(star_wars_characters_api).to receive(:get_people).and_return response
    end

    let(:star_wars_characters_api) { instance_double(StarWarsAPI::Characters::Request) }
    let!(:person) { create(:person, name: "Luke Skywalker") }
    let(:response) do
      OpenStruct.new(
        found?: true,
        data: [
          OpenStruct.new(
            name: "Luke Skywalker",
            image: "https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg"
          )
        ]
      )
    end

    it "imports images" do
      call

      person.reload

      expect(person.image_url).to eq response.data.first.image
    end
  end
end
