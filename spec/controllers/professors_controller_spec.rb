require 'rails_helper'

RSpec.describe ProfessorsController, type: :controller do
  
  describe 'create action' do

    before(:each) {
      @professor_params = {name: 'Raimundo Nonato', office: 'BT-58/11'}
    }

    it 'creates a new professor' do
      expect {
        post :create, params: { professor: @professor_params }
      }.to change(Professor, :count).by(1)
      expect(Professor.last.name).to eq('Raimundo Nonato')
      expect(Professor.last.office).to eq('BT-58/11')
    end

    it "redirects the user to the professor's page" do
      post :create, params: { professor: @professor_params }
      expect(response).to redirect_to(Professor.last)
    end

  end
  
  describe 'favorite professore feature' do

    let(:user) { FactoryBot.create(:user)}

    before(:each) do
      @professor = Professor.create(name:'Lamar')
      sign_in user
    end

    it 'favorites a professor' do
      expect do
        get :favorite, params: {id: @professor.id}
      end.to change(ProfessorUserFavorite, :count).by(1)

      expect(response).to redirect_to(professor_path(@professor))
    end

    it 'unfavorites a professor' do
      ProfessorUserFavorite.create(professor_id: @professor.id, user_id: user.id)

      expect do
        get :unfavorite, params: {id: @professor.id}
      end.to change(ProfessorUserFavorite, :count).by(-1)


      expect(response).to redirect_to(professor_path(@professor))
    end

  end

end
