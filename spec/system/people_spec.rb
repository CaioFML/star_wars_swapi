describe "People" do
  describe "index" do
    before do
      people

      visit people_path
    end

    let(:people) do
      [
        create(:person, name: "Luke Skywalker", image_url: "https://url1.com"),
        create(:person, name: "Darth Vader", image_url: "https://url2.com"),
        create(:person, name: "Leia Organa", image_url: "https://url3.com")
      ]
    end

    it "displays people cards" do
      expect(page).to have_selector("div.card.bg-dark.text-white", count: 3)
    end

    it "displays card info" do
      expect(page).to have_selector("a[href='#{person_path(people.first)}']")
      expect(page).to have_selector("div.card-img-overlay h5.card-title", text: "Luke Skywalker")
      expect(page).to have_selector("div.card img[src='https://url1.com']")

      expect(page).to have_selector("a[href='#{person_path(people.second)}']")
      expect(page).to have_selector("div.card-img-overlay h5.card-title", text: "Darth Vader")
      expect(page).to have_selector("div.card img[src='https://url2.com']")

      expect(page).to have_selector("a[href='#{person_path(people.third)}']")
      expect(page).to have_selector("div.card-img-overlay h5.card-title", text: "Leia Organa")
      expect(page).to have_selector("div.card img[src='https://url3.com']")
    end
  end

  describe "show" do
    before { visit person_path(person) }

    let(:person) do
      create(:person,
             name: "Anakin",
             image_url: "https://url1.com",
             height: "188",
             mass: "84",
             homeworld: create(:planet, name: "Tatooine"),
             birth_year: "41.9BBY",
             species: [create(:specie, name: "Human")],
             starships: [create(:starship, name: "Jedi interceptor")])
    end

    it "displays back button" do
      expect(page).to have_link "<< Back", href: people_path
    end

    it "displays card info" do
      expect(page).to have_selector("div.col-md-4.bg-dark img[src='https://url1.com']")
      expect(page).to have_selector("h5.card-title", text: "Anakin")
      expect(page)
        .to have_selector("p.card-text", text: "Hello! I'm Anakin. I'm a Human, my weight is 84 kg and my height "\
                                               "is 188 cm. My homeworld is Tatooine, I was born in the year 41.9BBY "\
                                               "and I've piloted Jedi interceptor.")
    end

    it "changes introduction language", js: true do
      click_link("change_language_wookiee")

      # Problema com ajax do capybara que não está respeitando o tempo da requisição, sleep com menor tempo possível.
      sleep 0.02

      wookie_text = page.find("p.card-text").text

      expect(wookie_text.split & PersonDecorator::WOOKIE_WORDS).to be_present

      click_link("change_language_english")

      expect(page)
        .to have_selector("p.card-text", text: "Hello! I'm Anakin. I'm a Human, my weight is 84 kg and my height "\
                                               "is 188 cm. My homeworld is Tatooine, I was born in the year 41.9BBY "\
                                               "and I've piloted Jedi interceptor.")
    end
  end
end
