describe PersonDecorator do
  describe "#introduction" do
    subject(:introduction) { person.decorate.introduction }

    let!(:person) do
      create(:person,
             name: "Anakin",
             height: "188",
             mass: "84",
             homeworld: create(:planet, name: "Tatooine"),
             birth_year: "41.9BBY",
             species: species,
             starships: starships)
    end

    let(:species) { [create(:specie, name: "Human")] }
    let(:starships) { [create(:starship, name: "Jedi interceptor")] }

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
end
