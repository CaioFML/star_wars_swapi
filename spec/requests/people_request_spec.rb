describe PeopleController do
  describe "GET #index" do
    subject(:get_index) { get people_path, params: { page: page } }

    before do
      create_list(:person, 4)

      get_index
    end

    context "with page params" do
      let(:page) { 1 }

      it { expect(response).to have_http_status :ok }

      it "shows coupons" do
        expect(assigns(:people).size).to eq 4
      end
    end

    context "without page params" do
      let(:page) { nil }

      it { expect(response).to have_http_status :ok }

      it "shows coupons" do
        expect(assigns(:people).size).to eq 4
      end
    end
  end
end
