require 'rails_helper'

RSpec.describe "search/index.html.erb", type: :view do
  it 'displays default text' do
    @tweets = { body: [] }

    render

    expect(rendered).to match('Twitter searcher')
  end
end
