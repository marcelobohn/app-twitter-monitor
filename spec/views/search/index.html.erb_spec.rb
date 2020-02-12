require 'rails_helper'

RSpec.describe "search/index.html.erb", type: :view do
  it 'displays default text' do
    render

    expect(rendered).to match('Search#index')
  end
end
