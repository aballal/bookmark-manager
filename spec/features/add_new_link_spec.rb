require_relative 'web_helper'

feature 'Adding a new link' do
  before do
    add_new_link('Makers Academy', 'http://makersacademy.com', 'education')
  end

  scenario 'Link has a title' do
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('Title: Makers Academy')
    end
    expect(Link.last.title).to eq 'Makers Academy'
  end

  scenario 'Link has a url' do
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('URL: http://makersacademy.com')
    end
    expect(Link.last.url).to eq 'http://makersacademy.com'
  end

  scenario 'Link has a tag' do
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('Tags: education')
    end
    expect(Link.last.tags.map(&:name)).to eq ['education']
  end
end
