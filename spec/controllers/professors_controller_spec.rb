require 'rails_helper'

RSpec.describe ProfessorsController, type: :controller do
  describe 'Test routes for Favorite and unfavorite professors' do

    let(:user) { FactoryBot.create(:user)}

    before(:each) do
      @professor = Professor.create(name:'Lamar')
      sign_in user
    end

    it 'Favorite a professor' do
      expect do
        get :favorite, params: {id: @professor.id}
      end.to change(ProfessorUserFavorite, :count).by(1)

      expect(response).to redirect_to(professor_path(@professor))
    end

    it 'Remove a professor' do
      ProfessorUserFavorite.create(professor_id: @professor.id, user_id: user.id)

      expect do
        get :unfavorite, params: {id: @professor.id}
      end.to change(ProfessorUserFavorite, :count).by(-1)


      expect(response).to redirect_to(professor_path(@professor))
    end

  end
end
