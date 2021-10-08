describe PersonStarship do
  describe "associations" do
    it { is_expected.to belong_to :person }
    it { is_expected.to belong_to :starship }
  end
end
