describe PersonSpecie do
  describe "associations" do
    it { is_expected.to belong_to :person }
    it { is_expected.to belong_to :specie }
  end
end
