describe StarWarsAPI::Characters::Request do
  describe "#get_people" do
    subject(:get_people) { described_class.new.get_people }

    let(:response) do
      {
        class: OpenStruct,
        found?: true,
        data: include(
          OpenStruct.new(
            id: 1,
            name: "Luke Skywalker",
            height: 1.72,
            mass: 73,
            gender: "male",
            homeworld: "tatooine",
            wiki: "http://starwars.wikia.com/wiki/Luke_Skywalker",
            image: "https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg",
            born: -19,
            bornLocation: "polis massa",
            died: 34,
            diedLocation: "ahch-to",
            species: "human",
            hairColor: "blond",
            eyeColor: "blue",
            skinColor: "light",
            cybernetics: "Prosthetic right hand",
            affiliations: [
              "Alliance to Restore the Republic",
              "Red Squadron",
              "Rogue Squadron",
              "Massassi Group",
              "Leia Organa's team",
              "Endor strike team",
              "Jedi Order",
              "Bright Tree tribe",
              "New Republic",
              "Resistance"
            ],
            masters: [
              "Obi-Wan Kenobi",
              "Yoda"
            ],
            apprentices: [
              "Leia Organa",
              "Ben Solo (along with a dozen apprentices)",
              "Rey"
            ],
            formerAffiliations: []
          )
        )
      }
    end

    it "returns list of people" do
      VCR.use_cassette("star_wars_api_get_people", match_requests_on: %i[method uri body]) do
        expect(get_people).to have_attributes(response)
      end
    end
  end
end
