describe PeopleController do
  describe "GET #index" do
    subject(:get_index) { get people_path, params: { page: page } }

    before do
      people

      get_index
    end

    let(:people) { create_list(:person, 3) }

    context "with page params" do
      let(:page) { 1 }

      it { expect(response).to have_http_status :ok }

      it "displays people" do
        expect(assigns(:people)).to eq people
      end
    end

    context "without page params" do
      let(:page) { nil }

      it { expect(response).to have_http_status :ok }

      it "displays people" do
        expect(assigns(:people)).to eq people
      end
    end
  end

  describe "GET #show" do
    subject! { get person_path(person) }

    let!(:person) { create(:person) }

    it { expect(response).to have_http_status :ok }

    it "displays person" do
      expect(assigns(:person)).to eq person
    end

    it { expect(assigns(:person)).to be_decorated }
  end
end
