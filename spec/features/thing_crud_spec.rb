require 'rails_helper'

feature 'Thing CRUD' do
  it 'allows anonymous' do
    visit '/things/new'

    click_button 'Create Thing'
    expect(page).to have_css('.has-error')

    fill_in 'Name', with: 'Bad Religion'
    click_button 'Create Thing'
    expect(page.current_path).to eq thing_path(Thing.last)
  end
end
