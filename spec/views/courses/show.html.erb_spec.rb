require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :kind => "Kind",
      :code => 2,
      :name => "Name",
      :turn => "Turn",
      :type => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Kind/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Turn/)
    expect(rendered).to match(/3/)
  end
end
