describe ChangeIntroductionLanguageController do
  describe "POST #create" do
    subject! { post change_introduction_language_index_path(person), xhr: true }

    let(:person) { create(:person) }

    it { expect(response).to have_http_status :ok }

    it { expect(assigns(:person)).to eq person }

    it { expect(assigns(:person)).to be_decorated }
  end
end
