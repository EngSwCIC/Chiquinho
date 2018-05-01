require 'rails_helper'

RSpec.describe "subjects/new", type: :view do
  before(:each) do
    assign(:subject, Subject.new(
      :code => 1,
      :name => "MyString",
      :credits => "MyString",
      :area => "MyString"
    ))
  end

  it "renders new subject form" do
    render

    assert_select "form[action=?][method=?]", subjects_path, "post" do

      assert_select "input[name=?]", "subject[code]"

      assert_select "input[name=?]", "subject[name]"

      assert_select "input[name=?]", "subject[credits]"

      assert_select "input[name=?]", "subject[area]"
    end
  end
end
