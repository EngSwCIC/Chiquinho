require 'rails_helper'

RSpec.describe Professor, type: :model do

  describe "getters and setters" do

    before(:each) {
      @professor = Professor.new(name: 'Raimundo Nonato', office: 'BT-58/11')
    }

    it 'sets office space' do
      expect(@professor.office).to eq('BT-58/11')
    end

    it 'can change office space' do
      @professor.office = 'AT-110/03'
      expect(@professor.office).to eq('AT-110/03')
    end

  end

end
