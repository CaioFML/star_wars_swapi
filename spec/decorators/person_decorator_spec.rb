describe PersonDecorator do
  describe "#introduction" do
    subject(:introduction) { person.decorate.introduction }

    let!(:person) do
      build(:person,
            name: "Anakin",
            height: "188",
            mass: "84",
            homeworld: build(:planet, name: "Tatooine"),
            birth_year: "41.9BBY",
            species: species,
            starships: starships)
    end

    let(:species) { [build(:specie, name: "Human")] }
    let(:starships) { [build(:starship, name: "Jedi interceptor")] }

    it "returns person introduction" do
      expect(introduction).to eq "Hello! I'm Anakin. I'm a Human, my weight is 84 kg and my height is 188 cm. "\
                                 "My homeworld is Tatooine, I was born in the year 41.9BBY and "\
                                 "I've piloted Jedi interceptor."
    end

    context "when person doesn't have species" do
      let(:species) { [] }

      it "returns person introduction" do
        expect(introduction).to eq "Hello! I'm Anakin. My weight is 84 kg and my height is 188 cm. My homeworld "\
                                   "is Tatooine, I was born in the year 41.9BBY and I've piloted Jedi interceptor."
      end
    end

    context "when person doesn't have starships" do
      let(:starships) { [] }

      it "returns person introduction" do
        expect(introduction).to eq "Hello! I'm Anakin. I'm a Human, my weight is 84 kg and my height is 188 cm. "\
                                   "My homeworld is Tatooine, I was born in the year 41.9BBY."
      end
    end
  end

  describe "#wookie_introduction" do
    subject(:wookie_introduction) { person.decorate.wookie_introduction }

    let(:person) { build(:person) }

    it "changes intro with wookie words" do
      expect(wookie_introduction.split & PersonDecorator::WOOKIE_WORDS).to be_present
    end
  end
end
