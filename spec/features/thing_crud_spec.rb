require 'rails_helper'

feature 'Thing CRUD' do
  it 'allows anonymous' do
    visit '/things/new'

    expect(page).to have_css("form #thing_name")
    expect(page).to_not have_css("form #thing_name.readonly")
    click_button 'Create Thing'
    expect(page).to have_css('.has-error')

    fill_in 'Name', with: 'Bad Religion'
    click_button 'Create Thing'
    expect(page.current_path).to eq thing_path(Thing.last)

    # edit
    thing = Thing.last
    visit "/things/#{thing.id}/edit"
    expect(page).to have_css("form #thing_name.readonly[value='Bad Religion']")
  end
end
