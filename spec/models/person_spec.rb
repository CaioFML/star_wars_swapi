describe Person do
  describe "associations" do
    it { is_expected.to belong_to(:homeworld).with_foreign_key(:planet_id).class_name("Planet") }
    it { is_expected.to have_many :person_species }
    it { is_expected.to have_many(:species).through(:person_species).source(:specie) }
  end
end