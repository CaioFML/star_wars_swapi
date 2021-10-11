describe ApplicationHelper do
  describe "#character_image" do
    let(:person) { build(:person, image_url: image_url) }

    context "when person have image url" do
      let(:image_url) { "https://test.com/image.jpg" }

      it "returns img tag with person image url" do
        expect(character_image(person)).to eq "<img class=\"card-img\" height=\"500\" src=\"#{image_url}\" />"
      end
    end

    context "when person doesn't have image url" do
      let(:image_url) { nil }

      it "returns img tag with person image url" do
        expect(character_image(person))
          .to match("<img class=\"card-img\" height=\"500\" src=\"/packs-test/media/images/unknown_character")
      end
    end
  end
end
