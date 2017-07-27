require_relative 'web_helper'

feature 'Adding a new link' do
  scenario 'A new link can be added' do
    add_new_link('Makers Academy', 'http://makersacademy.com', 'education')
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('Title: Makers Academy')
      expect(page).to have_content('URL: http://makersacademy.com')
      expect(page).to have_content('Tags: education')
    end
    link = Link.last
    expect(link.title).to eq 'Makers Academy'
    expect(link.url).to eq 'http://makersacademy.com'
    expect(link.tags.map(&:name)).to eq ['education']
  end
end
