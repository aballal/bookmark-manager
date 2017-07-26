feature 'Sign up to Bookmark Manager' do
  scenario 'new user signs up' do
    prev_count = User.all.count
    visit('/signup')
    email = 'akshatha.ballal@gmail.com'
    fill_in 'email', with: email
    fill_in 'password', with: 'password'
    click_button 'Sign up'
    expect(current_path).to eq '/links'
    expect(User.all.count).to eq (prev_count + 1)
    expect(page).to have_content "Welcome #{email} to Bookmark Manager"
  end
end
