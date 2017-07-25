feature 'New links' do
  scenario 'adding a new link' do
    visit '/links/new'
    fill_in 'address', with: 'http://makersacademy.com'
    fill_in 'title', with: 'Makers Academy'
    click_button 'Submit'
    expect(page).to have_content('Makers Academy')
  end
end
