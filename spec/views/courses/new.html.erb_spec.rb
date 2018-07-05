require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new(
      :kind => "MyString",
      :code => 1,
      :name => "MyString",
      :turn => "MyString",
      :classification => 1
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input[name=?]", "course[kind]"

      assert_select "input[name=?]", "course[code]"

      assert_select "input[name=?]", "course[name]"

      assert_select "input[name=?]", "course[turn]"

      assert_select "input[name=?]", "course[type]"
    end
  end
end
