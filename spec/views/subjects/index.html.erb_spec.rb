require 'rails_helper'

RSpec.describe "subjects/index", type: :view do
  before(:each) do
    assign(:subjects, [
      Subject.create!(
        :code => 2,
        :name => "Name",
        :credits => "Credits",
        :area => "Area"
      ),
      Subject.create!(
        :code => 2,
        :name => "Name",
        :credits => "Credits",
        :area => "Area"
      )
    ])
  end

  it "renders a list of subjects" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Credits".to_s, :count => 2
    assert_select "tr>td", :text => "Area".to_s, :count => 2
  end
end
