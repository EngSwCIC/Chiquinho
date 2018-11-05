require 'rails_helper'

RSpec.describe ProfessorUserFavorite, type: :model do
  describe "Create and Remove favorite" do

    let(:user) { FactoryBot.create(:user)}

    before(:each) do
      @professor = Professor.create(name: 'Lamar')
    end

    it 'Favorite a professor' do
      fav = ProfessorUserFavorite.create(professor_id: @professor.id, user_id: user.id)
      expect(fav).to be_valid
    end

    it 'Remove a professor' do
      fav = ProfessorUserFavorite.create(professor_id: @professor.id, user_id: user.id)
      fav.destroy
      expect(ProfessorUserFavorite.where('professor_id = ? and user_id = ?', @professor.id, user.id).first).to eq(nil)
    end

  end
end
