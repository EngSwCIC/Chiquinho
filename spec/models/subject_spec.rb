require 'rails_helper'

RSpec.describe Subject, type: :model do
  before do
    FactoryBot.create(:subject, code: '116441', name: 'ENGENHARIA DE SOFTWARE', credits: '004 000 000 004', area: 'AC')
    FactoryBot.create(:subject, code: '116442', name: 'ENGENHARIA DE REDES', credits: '004 000 000 004', area: 'AC')
  end

  describe '#find_by_name' do
    context 'when search for a commom word' do
      it 'return engenharias' do
        expect(Subject.find_by_name('ENGENHARIA').count).to eq(2)
      end
    end

    context 'when search for a specific word' do
      it 'return uniq record' do
        expect(Subject.find_by_name('SOFTWARE').count).to eq(1)
      end
    end
  end

  describe '#find_by_area' do
    it 'return subjects with specific area' do
      expect(Subject.find_by_area('AC').count).to eq(2)
    end
  end
end
