require_relative 'web_helper'

feature 'Adding a new link' do
  before do
    add_new_link('Makers Academy', 'http://makersacademy.com', 'education')
  end

  scenario 'adding title' do
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

  scenario 'adding url' do
    within 'ul#links' do
      expect(page).to have_content('http://makersacademy.com')
    end
  end

  scenario 'adding tag' do
    link = Link.last
    expect(link.tags.map(&:name)).to include('education')
  end
end
