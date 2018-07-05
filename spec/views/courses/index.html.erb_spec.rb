require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :kind => "obrigatória",
        :code => 2,
        :name => "Curso 1",
        :turn => "Turn",
        :classification => 1
      ),
      Course.create!(
        :kind => "obrigatória",
        :code => 2,
        :name => "Curso 2",
        :turn => "Turn",
        :classification => 1
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "obrigatória".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Curso 1".to_s, :count => 1
    assert_select "tr>td", :text => "Turn".to_s, :count => 2
  end
end
