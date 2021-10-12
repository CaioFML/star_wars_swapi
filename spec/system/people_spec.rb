describe "People" do
  describe "index" do
    before do
      people

      visit people_path
    end

    let(:people) do
      [
        create(:person, name: "Luke Skywalker"),
        create(:person, name: "Darth Vader"),
        create(:person, name: "Leia Organa")
      ]
    end

    it "displays people cards" do
      expect(page).to have_selector("div.card.bg-dark.text-white", count: 3)
    end

    it "displays card info" do
      expect(page).to have_selector("a[href='#{person_path(people.first)}']")
      expect(page).to have_selector("div.card-img-overlay h5.card-title", text: "Luke Skywalker")

      expect(page).to have_selector("a[href='#{person_path(people.second)}']")
      expect(page).to have_selector("div.card-img-overlay h5.card-title", text: "Darth Vader")

      expect(page).to have_selector("a[href='#{person_path(people.third)}']")
      expect(page).to have_selector("div.card-img-overlay h5.card-title", text: "Leia Organa")
    end
  end
end
