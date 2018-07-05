RSpec.describe Registrations::RegistrationsController, type: :controller do
  describe 'PATCH update' do
    let(:user) { FactoryBot.create(:user)}
    let(:attr) do
      { :first_name => Faker::Name.unique.name, :last_name => Faker::Name.unique.name, :matricula => "15/0019343" }
    end
    context "with valid params" do
      # before(:each) do
      #   put :update, :id => user.id, :user => attr
      #   user.reload
      # end
      #
      # it "returns http 204" do
      #   puts response
      #   expect(response).to have_http_status(204)
      # end
      # it "updates the database" do
      #   expect(User.find_by(first_name: "Nicholas")).to be_truthy
      # end
    end
  end
end