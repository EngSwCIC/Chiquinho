require 'rails_helper'

RSpec.describe SubjectClass, type: :model do

  before(:each) do
    ["Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado"].each do |weekday|
      WeekDay.create(day:weekday)
    end
  end

  it 'in an array can be ordered by name' do
    FactoryBot.create_list(:subject_class, 5)
    classes = SubjectClass.all
    ordered = classes.order("name")
    last_name = nil
    ordered.each do |c|
      if last_name
        expect(c.name).to be >= last_name
      end
      last_name = c.name
    end
  end


  context "valid subject_class" do
    let(:subject) { FactoryBot.create(:subject) }
    let(:professor) { FactoryBot.create(:professor) }
    let(:subject_class) { FactoryBot.create(:subject_class_with_schedules, name:"A", professor: professor, subject: subject) }

    it 'gets its name correctly' do
      value = subject_class.name
    end

    it 'gets its professor correctly' do
      value = subject_class.professor
    end

    it 'gets its schedule correctly' do
      value = subject_class.class_schedules
      expect(value.length).to eq(5)
    end
  end

  describe "Create and update subject class" do

    context "with valid params" do
      let(:subject) { FactoryBot.create(:subject)}
      let(:professor){ FactoryBot.create(:professor)}

      before do
        @params = {name: "A",
                  subject_id: subject.id,
                  professor_id: professor.id}
      end

      it "create a subject class" do
        expect(SubjectClass.create(@params)).to be_valid
      end

      it "update an existent subject class" do
        subject_class = SubjectClass.create(@params)
        subject_class.name = "B"
        subject_class.save!

        expect(subject_class.name).to eq(SubjectClass.last.name)
      end
    end

  end
end
