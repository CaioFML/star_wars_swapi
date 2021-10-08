describe Planet do
  describe "associations" do
    it { is_expected.to have_many(:residents).inverse_of(:homeworld).dependent(:nullify) }
  end
end
