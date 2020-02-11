require 'rails_helper'

RSpec.describe 'Home page', type: :system do
  it 'have initial text' do
    visit '/'
    expect(page).to have_text('Twitter monitor')
  end
end
