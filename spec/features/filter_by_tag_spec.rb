feature 'Filtering by tags' do
  scenario 'Can see links filtered by a tag' do
    add_new_link('Makers Academy', 'http://makersacademy.com', 'education')
    add_new_link('Google', 'http://google.com', 'search')
    visit('/tags/search')
    expect(page.status_code).to eq 200
    expect(page).not_to have_content('Makers Academy')
    expect(page).to have_content('Google')
  end
end
