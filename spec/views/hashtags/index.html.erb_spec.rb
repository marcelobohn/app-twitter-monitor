require 'rails_helper'

RSpec.describe "hashtags/index", type: :view do
  before(:each) do
    assign(:hashtags, [
      Hashtag.create!(
        term: "Term"
      ),
      Hashtag.create!(
        term: "Term"
      )
    ])
  end

  it "renders a list of hashtags" do
    render
    assert_select "tr>td", text: "Term".to_s, count: 2
  end
end
