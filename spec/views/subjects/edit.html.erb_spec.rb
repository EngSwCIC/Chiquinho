require 'rails_helper'

RSpec.describe "subjects/edit", type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      :code => 1,
      :name => "MyString",
      :credits => "MyString",
      :area => "MyString"
    ))
  end

  it "renders the edit subject form" do
    render

    assert_select "form[action=?][method=?]", subject_path(@subject), "post" do

      assert_select "input[name=?]", "subject[code]"

      assert_select "input[name=?]", "subject[name]"

      assert_select "input[name=?]", "subject[credits]"

      assert_select "input[name=?]", "subject[area]"
    end
  end
end
