describe Starship do
  describe "associations" do
    it { is_expected.to have_many(:person_starships).dependent(:destroy) }
    it { is_expected.to have_many(:people).through(:person_starships) }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
