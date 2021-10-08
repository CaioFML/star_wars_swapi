describe Person do
  describe "associations" do
    it { is_expected.to belong_to(:homeworld).with_foreign_key(:planet_id).class_name("Planet").inverse_of(:residents) }
    it { is_expected.to have_many(:person_species).dependent(:destroy) }
    it { is_expected.to have_many(:species).through(:person_species).source(:specie) }
    it { is_expected.to have_many(:person_starships).dependent(:destroy) }
    it { is_expected.to have_many(:starships).through(:person_starships) }
  end
end
