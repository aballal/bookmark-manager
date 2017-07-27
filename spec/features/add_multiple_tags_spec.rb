feature 'Adding multiple tags' do
  scenario 'Link can have multiple tags' do
    add_new_link('Makers Academy', 'http://makersacademy.com', 'education ruby')
    expect(current_path).to eq '/links'
    expect(page).to have_content('Tags: education ruby')
    expect(Link.last.tags.map(&:name)).to include('education', 'ruby')
  end
end
