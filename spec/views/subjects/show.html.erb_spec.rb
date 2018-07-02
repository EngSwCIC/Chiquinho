require 'rails_helper'

RSpec.describe "subjects/show", type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      :code => 2,
      :name => "Name",
      :credits => "Credits",
      :area => "Area"
    ))
  end

  it "renders attributes in <p>" do
    # pending
    # render
    # expect(rendered).to match(/2/)
    # expect(rendered).to match(/Name/)
    # expect(rendered).to match(/Credits/)
    # expect(rendered).to match(/Area/)
  end
end
