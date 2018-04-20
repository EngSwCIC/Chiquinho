require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :kind => "Kind",
        :code => 2,
        :name => "Name",
        :turn => "Turn",
        :type => 3
      ),
      Course.create!(
        :kind => "Kind",
        :code => 2,
        :name => "Name",
        :turn => "Turn",
        :type => 3
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Kind".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Turn".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
