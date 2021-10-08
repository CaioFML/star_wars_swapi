describe Person do
  describe "associations" do
    it { is_expected.to belong_to(:homeworld).with_foreign_key(:planet_id).class_name("Planet") }
  end
end
