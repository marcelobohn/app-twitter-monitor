require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  it 'displays default text' do
    @hashtags = {}

    render

    expect(rendered).to match('Twitter monitor')
  end
end
