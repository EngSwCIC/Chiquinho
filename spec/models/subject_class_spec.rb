require 'rails_helper'

RSpec.describe SubjectClass, type: :model do
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