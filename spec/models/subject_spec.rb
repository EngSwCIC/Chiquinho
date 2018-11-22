require 'rails_helper'

RSpec.describe Subject, type: :model do

  let(:subject) { FactoryBot.create(:subject_with_classes, classes_count: 5) }

  it "gets all classes it has" do
    classes = subject.subject_classes
    expect(classes).to_not be nil
    expect(classes.length).to eq 5
    # expect(classes.length).to eq(5)
  end
end
