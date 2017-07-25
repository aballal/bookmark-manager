feature 'New links' do
  scenario 'adding a new link' do
    visit '/links/new'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http://makersacademy.com'
    click_button 'Submit'
    expect(page).to have_content('Makers Academy')
  end
end
