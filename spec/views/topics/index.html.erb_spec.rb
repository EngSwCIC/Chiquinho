require 'rails_helper'

RSpec.describe "topics/index", type: :view do
  before(:each) do
    assign(:topics, [
      Topic.create!(
        :title => "Topico teste 1",
        :description => "Que dia bonito"
      ),
      Topic.create!(
        :title => "Topico teste 2",
        :description => "Que noite feia"
      )
    ])
  end

  it "renders a list of topics" do
    render
    assert_select "tr>td", :text => "Topico teste 1".to_s, :count => 1
    assert_select "tr>td", :text => "Topico teste 2".to_s, :count => 1

  end
end
