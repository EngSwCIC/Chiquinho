require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :kind => "MyString",
      :code => 1,
      :name => "MyString",
      :turn => "MyString",
      :classification => 1
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input[name=?]", "course[kind]"

      assert_select "input[name=?]", "course[code]"

      assert_select "input[name=?]", "course[name]"

      assert_select "input[name=?]", "course[turn]"

      assert_select "input[name=?]", "course[type]"
    end
  end
end
