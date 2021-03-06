describe Specie do
  describe "associations" do
    it { is_expected.to have_many(:person_species).dependent(:destroy) }
    it { is_expected.to have_many(:people).through(:person_species).source(:person) }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
