RSpec.describe Registrations::RegistrationsController, type: :controller do
  describe 'PATCH update' do
    let(:user) { FactoryBot.create(:user)}
    context "with valid params" do
      before do
        patch :update, params: {user: user_params}
      end
      let(:user_params) do
        { user: {
            first_name: "Nicholas",
            last_name: "Marques",
            matricula: "15/0019343"
          }
        }
      end
      it "returns http 204" do
        expect(response).to have_http_status(204)
      end
      it "updates the database" do
        expect(User.find_by(name: "Nicholas").to be_truthy
      end
    end
  end
end