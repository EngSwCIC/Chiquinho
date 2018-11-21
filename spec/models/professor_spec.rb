require 'rails_helper'

RSpec.describe Professor, type: :model do

  describe "getters and setters" do

    before(:each) {
      @professor = Professor.new(name: 'Raimundo Nonato', office: 'BT-58/11')
    }

    it 'set office space' do
      expect(@professor.office).to eq('BT-58/11')
    end

    it 'can change office space' do
      @professor.office = 'AT-110/03'
      expect(@professor.office).to eq('AT-110/03')
    end

  end
  
  describe "professor score" do
    before(:each){
      @user = User.create
      @subject = Subject.create
      @professorsubject = ProfessorSubject.create(subject: @subject)
      @tests = [
        {name: "Maria", scores: [{trabalhos: 10, provas: 10, tarefas: 10}]},
        {name: "João", scores: [{trabalhos: 9, provas: 8, tarefas: 7}]}
      ]
      @tests.each do |t|
        @professor = Professor.create(name: t[:name])
        t[:scores].each do |s|
          ProfessorSubjectUser.create!(
            user: @user,
            professor_subject: @professorsubject,
            professor_id: @professor.id, 
            trabalhos: s[:trabalhos], 
            provas: s[:provas], 
            tarefas: s[:tarefas])
        end
      end
    }
    
    it "returns 8 for João" do
      expect(Professor.find_by(name: "João").score).to eq(8)
    end
    
    it "returns 10 for Maria" do
      expect(Professor.find_by(name: "Maria").score).to eq(10)
    end
  end
  
  describe "professor count_favorites" do
    before(:each){
      [{nome: "João", count: 12}, {nome: "Maria", count: 200}].
      ProfessorUserFavorite.create!(professor_id: Professor.find_by(name: row[:nome]).id, user: User.new)
    }
  end

end
