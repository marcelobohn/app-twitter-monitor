require 'rails_helper'

RSpec.describe "hashtags/edit", type: :view do
  before(:each) do
    @hashtag = assign(:hashtag, Hashtag.create!(
      term: "MyString"
    ))
  end

  it "renders the edit hashtag form" do
    render

    assert_select "form[action=?][method=?]", hashtag_path(@hashtag), "post" do

      assert_select "input[name=?]", "hashtag[term]"
    end
  end
end
