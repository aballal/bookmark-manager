feature 'Viewing links' do
  scenario 'existing links displayed on homepage' do
    Link.destroy
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Link.create(url: 'http://www.google.com', title: 'Google')
    Link.create(url: 'https://github.com/', title: 'GitHub')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
