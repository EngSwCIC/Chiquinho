require 'rails_helper'

RSpec.describe SubjectClassesController, type: :controller do

  describe "GET #show" do
    let(:subject_class){ FactoryBot.create(:subject_class)}

    it "returns http success" do
      get :show, params: { id: subject_class.id}
      expect(response).to have_http_status(:success)
    end
  end

end
